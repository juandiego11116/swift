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

struct CalculatorManager {
    
    var delegate: CalculadorManagerDelegate?
    let currencyArray = [["EUR", "USD","AUD","CAD","PLN","MXN"],["EUR", "USD","AUD","CAD","PLN","MXN"],]
    
    func getResult(currencyOrigen: String, CurrencyResult: String, valueCurrencyOrigen: String) {
        
        let urlString = "http://data.fixer.io/api/latest?access_key=9eb5bd4f64abb52dd606cce6d264f865&symbols=USD,AUD,CAD,PLN,MXN&format=1"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let convertions = self.parseJSON(safeData){
                        var origenValue: Double = 0
                        var result: Double = 0
                        switch currencyOrigen {
                        case "EUR":
                            origenValue = 1 * Double(valueCurrencyOrigen)!
                        case "USD":
                            origenValue = (1 / convertions.USD) * Double(valueCurrencyOrigen)!
                        case "AUD":
                            origenValue = (1 / convertions.AUD) * Double(valueCurrencyOrigen)!
                        case "CAD":
                            origenValue = (1 / convertions.CAD) * Double(valueCurrencyOrigen)!
                        case "PLN":
                            origenValue = (1 / convertions.PLN) * Double(valueCurrencyOrigen)!
                        case "MXN":
                            origenValue = (1 / convertions.MXN) * Double(valueCurrencyOrigen)!
                        default:
                            origenValue = 0
                        }
                       
                        switch CurrencyResult {
                        case "EUR":
                            result = origenValue
                        case "USD":
                            result = origenValue * convertions.USD
                        case "AUD":
                            result = origenValue * convertions.AUD
                        case "CAD":
                            result = origenValue * convertions.CAD
                        case "PLN":
                            result = origenValue * convertions.PLN
                        case "MXN":
                            result = origenValue * convertions.MXN
                        default:
                            result = 0
                        }
                        self.delegate?.didUpdateResult(String(format: "%.2f", result))
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ conversorData: Data) -> ConversorModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ConversorData.self, from: conversorData)
            let USD = decodedData.rates.USD
            let AUD = decodedData.rates.AUD
            let CAD = decodedData.rates.CAD
            let PLN = decodedData.rates.PLN
            let MXN = decodedData.rates.MXN
            let convertions = ConversorModel(USD: USD, AUD: AUD, CAD: CAD, PLN: PLN, MXN: MXN)
            return convertions
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
