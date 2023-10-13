//
//  ViewController.swift
//  Calculator
//
//  Created by Leidy Luna on 15/07/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func equal(_ sender: Any) {
       
        var aux: String = ""
        var operationInArray: [String] = []
        
        for char in mainLabel.text ?? "0" {
            if char.isNumber || char == "."{
                 aux.append(char)
            } else {
                operationInArray.append(aux)
                operationInArray.append(String(char))
                aux = ""
            }
        }
        operationInArray.append(aux)
        operations( with: &operationInArray, i: 0)
    }
    
    func operations(with operationsArray: inout [String], i: Int){
        
        var i = i
        var aux: Float
        
            if operationsArray.contains("/") || operationsArray.contains("*"){
                if operationsArray[i].contains("/") {
                    aux = Float(operationsArray[i - 1])! / Float(operationsArray[i + 1])!
                    operationsArray.remove(at: i + 1)
                    i -= 1
                    operationsArray.remove(at: i + 1)
                    operationsArray[i] = String(aux)
                    aux = 0
                } else if operationsArray[i].contains("*") {
                    aux = Float(operationsArray[i - 1])! * Float(operationsArray[i + 1])!
                    operationsArray.remove(at: i + 1)
                    i -= 1
                    operationsArray.remove(at: i + 1)
                    operationsArray[i] = String(aux)
                    aux = 0
                }
                operations(with: &operationsArray, i: i + 1)
            }

        i = 0
        
        while i >= 0  && i < operationsArray.count && operationsArray.count > 2{
            if operationsArray.contains("-") || operationsArray.contains("+") {
                if operationsArray[i].contains("+") {
                    aux = Float(operationsArray[i - 1])! + Float(operationsArray[i + 1])!
                    operationsArray.remove(at: i + 1)
                    i -= 1
                    operationsArray.remove(at: i + 1)
                    operationsArray[i] = String(aux)
                    aux = 0
                    
                } else if operationsArray[i].contains("-") {
                    aux = Float(operationsArray[i - 1])! - Float(operationsArray[i + 1])!
                    operationsArray.remove(at: i + 1)
                    i -= 1
                    operationsArray.remove(at: i + 1)
                    operationsArray[i] = String(aux)
                    aux = 0
                }
                i += 1
            }
        }
        
        let formatter = NumberFormatter()
        
        if operationsArray[0].hasSuffix(".0") {
            mainLabel.text = formatter.string(from: Double(operationsArray[0])! as NSNumber) ?? "n/a"
        } else {
            mainLabel.text = operationsArray[0]
        }
    }
    
    @IBAction func plusMinusButton(_ sender: Any) {
      if mainLabel.text?.first == "-" {
            mainLabel.text?.removeFirst()
        } else if mainLabel.text?.first != "-" && mainLabel.text?.first != "0" {
            mainLabel.text = "-" + (mainLabel.text ?? "0")
        }
    }
    
    @IBAction func percentage(_ sender: Any) {
        mainLabel.text = String((Double(mainLabel.text ?? "0") ?? 0) * Double(0.01))
    }
    
    @IBAction func operationsButton(_ sender: UIButton) {
       
        var characterSet = CharacterSet.init()
        characterSet.insert(charactersIn: "+-*/0")
        
        if characterSet.contains(Unicode.Scalar(String((mainLabel.text?.last) ?? "0")) ?? "0") {
        } else {
            mainLabel.text?.append(sender.titleLabel?.text ?? "0")
        }
    }
    
    @IBAction func ACButton(_ sender: Any) {
        mainLabel.text = "0"
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        mainLabel.text == "0" ? mainLabel.text = sender.titleLabel?.text : mainLabel.text?.append(sender.titleLabel?.text ?? "0")
    }
    
    @IBAction func pointDecimal(_ sender: Any) {
        if ((mainLabel.text?.contains(".")) == false){
            mainLabel.text?.append(".")
        } else {
            mainLabel.text = mainLabel.text
        }
    }
}

