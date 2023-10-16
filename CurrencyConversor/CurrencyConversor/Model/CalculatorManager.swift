//
//  CalculatorManager.swift
//  CurrencyConversor
//
//  Created by Leidy Luna on 29/08/23.
//

import Foundation


protocol CalculadorManagerDelegate {
    func didUpdateResult(_ currencyResult: String)
    func didFailWithError(error: Error)
}

class CalculatorManager {
    
    var delegate: CalculadorManagerDelegate?
    let currencyArray = [["EUR", "USD","AUD","CAD","PLN","MXN"],["EUR", "USD","AUD","CAD","PLN","MXN"],]
    
    func getResult(currencyOrigen: String, CurrencyResult: String, valueCurrencyOrigen: String) {
        
        let urlString = "http://data.fixer.io/api/latest?access_key=9eb5bd4f64abb52dd606cce6d264f865&symbols=USD,AUD,CAD,PLN,MXN&format=1"
        
        guard let url = URL(string: urlString) else {
            return
        }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }
            if let safeData = data, let convertions = self.parseJSON(safeData) {
                var origenValue: Double = 0
                var result: Double = 0
                switch currencyOrigen {
                case "EUR":
                    origenValue = 1 * Double(valueCurrencyOrigen)!
                case "USD":
                    origenValue = (1 / convertions.americanDollar) * Double(valueCurrencyOrigen)!
                case "AUD":
                    origenValue = (1 / convertions.australianDollar) * Double(valueCurrencyOrigen)!
                case "CAD":
                    origenValue = (1 / convertions.canadanDolar) * Double(valueCurrencyOrigen)!
                case "PLN":
                    origenValue = (1 / convertions.polacoZloty) * Double(valueCurrencyOrigen)!
                case "MXN":
                    origenValue = (1 / convertions.mexicanPeso) * Double(valueCurrencyOrigen)!
                default:
                    origenValue = 0
                }
                
                switch CurrencyResult {
                case "EUR":
                    result = origenValue
                case "USD":
                    result = origenValue * convertions.americanDollar
                case "AUD":
                    result = origenValue * convertions.australianDollar
                case "CAD":
                    result = origenValue * convertions.canadanDolar
                case "PLN":
                    result = origenValue * convertions.polacoZloty
                case "MXN":
                    result = origenValue * convertions.mexicanPeso
                default:
                    result = 0
                }
                self.delegate?.didUpdateResult(String(format: "%.2f", result))
            }
        }
        task.resume()
    }
    
    func parseJSON(_ conversorData: Data) -> ExchangeRate? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ConversorData.self, from: conversorData)
            let convertions = ExchangeRate(americanDollar: decodedData.rates.usd, australianDollar: decodedData.rates.aud, canadanDolar: decodedData.rates.cad, polacoZloty: decodedData.rates.pln, mexicanPeso: decodedData.rates.mxn)
            return convertions
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
