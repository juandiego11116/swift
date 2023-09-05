//
//  ViewController.swift
//  CurrencyConversor
//
//  Created by Leidy Luna on 28/08/23.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var currencyOrigen: UITextField!
    @IBOutlet weak var currencyResult: UILabel!
    @IBOutlet weak var origenLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    var calculatorManager = CalculatorManager()
    var origenCurrency = "EUR"
    var resultCurrency = "USD"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorManager.delegate = self
        currencyPicker.delegate = self
        currencyOrigen.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
            //Las vistas y toda la jerarquía renuncia a responder, para esconder el teclado
            view.endEditing(true)
        }
}

extension ViewController: CalculadorManagerDelegate{
    func didUpdateResult(_ currencyResult: String) {
        DispatchQueue.main.async {
            self.currencyResult.text = currencyResult
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return calculatorManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return calculatorManager.currencyArray[component].count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return calculatorManager.currencyArray[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let valueCurrencyOrigen = currencyOrigen.text!
        
        switch(component){
        case 0:
            origenCurrency = calculatorManager.currencyArray[component][row]
            origenLabel.text = origenCurrency
            
            break;
        case 1:
            resultCurrency = calculatorManager.currencyArray[component][row]
            resultLabel.text = resultCurrency
        default:
            didFailWithError(error: "you don´t seleted Currencies" as! Error)
        }
        calculatorManager.getResult(currencyOrigen: origenCurrency, CurrencyResult: resultCurrency, valueCurrencyOrigen: valueCurrencyOrigen)
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
