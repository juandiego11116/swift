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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func equal(_ sender: Any) {
       
       var aux = ""
       var someInts: [String] = []
        
        for char in mainLabel.text! {
            if char == "0" || char == "1" || char == "2" || char == "3" || char == "4" || char == "5" || char == "6" || char == "7" || char == "8" || char == "9"{
                aux = aux + String(char)
            }else{
                someInts.append(aux)
                someInts.append(String(char))
                aux = ""
                
            }
            
        }
        someInts.append(aux)
        operations(some: &someInts)
        
        
    }
    
    func operations(some: inout [String]){
        var i = 0
        
        var aux: Double
        while i >= 0  && i < some.count {
            if some.contains("/") == true || some.contains("*") == true{
                if some[i].contains("/") == true {
                    aux = Double(some[i - 1])! / Double(some[i + 1])!
                    some.remove(at: i + 1)
                    i -= 1
                    some.remove(at: i + 1)
                    some[i] = String(aux)
                    aux = 0
                }else if some[i].contains("*") == true {
                    aux = Double(some[i - 1])! * Double(some[i + 1])!
                    some.remove(at: i + 1)
                    i -= 1
                    some.remove(at: i + 1)
                    some[i] = String(aux)
                    aux = 0
                }
            }
                i += 1
            }
        
        i = 0
        while i >= 0  && i < some.count {
            if some.contains("-") == true || some.contains("+") == true{
                if some[i].contains("+") == true {
                    aux = Double(some[i - 1])! + Double(some[i + 1])!
                    some.remove(at: i + 1)
                    i -= 1
                    some.remove(at: i + 1)
                    some[i] = String(aux)
                    aux = 0
                    
                }else if some[i].contains("-") == true {
                    aux = Double(some[i - 1])! - Double(some[i + 1])!
                    some.remove(at: i + 1)
                    i -= 1
                    some.remove(at: i + 1)
                    some[i] = String(aux)
                    aux = 0
                }
            }
            i += 1
        }
        let num4 = some[0]
        let num3 = String(num4).components(separatedBy: ".")
        
        if Int(num3[1]) == 0 {
            let num5 = Int(num4)
            mainLabel.text = num3[0]
        }else{
                        mainLabel.text = some[0]
        }
          
//        for num in some {
//            if num == "*"{
//                let num1 = num.index(before: num.endIndex)
//                print(num1)
//                result = Int(num.index(before: num)) * Int(num.index(after: num))
//            }
//        }
        
        
    }
    
    @IBAction func plusOrLessBotton(_ sender: Any) {
        if mainLabel.text == "0" {
            
            
        }else if mainLabel.text?.first == "-" {
            mainLabel.text?.removeFirst()
        }
        else if mainLabel.text?.first != "-" && mainLabel.text?.first != "0" {
            mainLabel.text = "-" + mainLabel.text!
        }
    }
    
    @IBAction func percentage(_ sender: Any) {
        
        mainLabel.text = String(Double(mainLabel.text!)! * Double(0.01))
    }
    
    @IBAction func divide(_ sender: Any) {
        if mainLabel.text == "0"{
            
            
        } else if mainLabel.text?.last == "/" || mainLabel.text?.last == "*" || mainLabel.text?.last == "+" || mainLabel.text?.last == "-" {
            
        }else{
            mainLabel.text?.append("/")
        }
        
//        if mainLabel.text?.last == "/" || mainLabel.text?.last == "*" || mainLabel.text?.last == "+" || mainLabel.text?.last == "-" || mainLabel.text == "0" {
//
//        }else if ((mainLabel.text?.contains("/")) == true){
//            let number1 = mainLabel.text?.components(separatedBy: "/")
//            let num1 = Double((number1?[0])!)
//            let num2 = Double((number1?[1])!)
//            let num3 = Double(num1!) / Double(num2!)
//            let num4 = String(num3).components(separatedBy: ".")
//
//            if Int(num4[1] ) == 0 {
//
//                mainLabel.text = String(Int(num3))
//            }else{
//                mainLabel.text = String(num3)
//
//            }
//        }else if ((mainLabel.text?.contains("*")) == true) {
//            let number1 = mainLabel.text?.components(separatedBy: "*")
//            let num1 = Double((number1?[0])!)
//            let num2 = Double((number1?[1])!)
//            let num3 = Double(num1!) * Double(num2!)
//            let num4 = String(num3).components(separatedBy: ".")
//
//            if Int(num4[1] ) == 0 {
//
//                mainLabel.text = String(Int(num3))
//            }else{
//                mainLabel.text = String(num3)
//
//            }
//        }else if ((mainLabel.text?.contains("-")) == true) {
//            let number1 = mainLabel.text?.components(separatedBy: "-")
//            let num1 = Double((number1?[0])!)
//            let num2 = Double((number1?[1])!)
//            let num3 = Double(num1!) - Double(num2!)
//            let num4 = String(num3).components(separatedBy: ".")
//
//            if Int(num4[1] ) == 0 {
//
//                mainLabel.text = String(Int(num3))
//            }else{
//                mainLabel.text = String(num3)
//
//            }
//        }else if ((mainLabel.text?.contains("+")) == true) {
//            let number1 = mainLabel.text?.components(separatedBy: "+")
//            let num1 = Double((number1?[0])!)
//            let num2 = Double((number1?[1])!)
//            let num3 = Double(num1!) + Double(num2!)
//            let num4 = String(num3).components(separatedBy: ".")
//
//            if Int(num4[1] ) == 0 {
//
//                mainLabel.text = String(Int(num3))
//            }else{
//                mainLabel.text = String(num3)
//            }
//        }
//        else{
//            mainLabel.text?.append("/")
//        }
    }
    
    
    @IBAction func multiplication(_ sender: Any) {
        if mainLabel.text == "0"{
            
            
        } else if mainLabel.text?.last == "/" || mainLabel.text?.last == "*" || mainLabel.text?.last == "+" || mainLabel.text?.last == "-" {
            
        }else{
            mainLabel.text?.append("*")
        }
    }
    
    @IBAction func less(_ sender: Any) {
        if mainLabel.text == "0"{
            
            
        } else if mainLabel.text?.last == "/" || mainLabel.text?.last == "*" || mainLabel.text?.last == "+" || mainLabel.text?.last == "-" {
            
        }else{
            mainLabel.text?.append("-")
        }
    }
    
    @IBAction func plus(_ sender: Any) {
        if mainLabel.text == "0"{
            
            
        } else if mainLabel.text?.last == "/" || mainLabel.text?.last == "*" || mainLabel.text?.last == "+" || mainLabel.text?.last == "-" {
            
        }else{
            mainLabel.text?.append("+")
        }
    }
    
    @IBAction func ACBotton(_ sender: Any) {
        mainLabel.text = "0"
    }
    
    @IBAction func pointDecimal(_ sender: Any) {
        if ((mainLabel.text?.contains(".")) == false){
            mainLabel.text?.append(".")
        }else{
            mainLabel.text = mainLabel.text
            
        }
    }
    
    @IBAction func nineNumber(_ sender: Any) {
        if mainLabel.text == "0"{
            mainLabel.text = "9"
            
        }else{
            mainLabel.text?.append("9")
        }
    }
    @IBAction func eightNumber(_ sender: Any) {
        if mainLabel.text == "0"{
            mainLabel.text = "8"
            
        }else{
            mainLabel.text?.append("8")
        }
    }
    @IBAction func sevenNumber(_ sender: Any) {
        if mainLabel.text == "0"{
            mainLabel.text = "7"
            
        }else{
            mainLabel.text?.append("7")
        }
    }
    
    @IBAction func sixNumber(_ sender: Any) {
        if mainLabel.text == "0"{
            mainLabel.text = "6"
            
        }else{
            mainLabel.text?.append("6")
        }
    }
    
    @IBAction func fiveNumber(_ sender: Any) {
        if mainLabel.text == "0"{
            mainLabel.text = "5"
            
        }else{
            mainLabel.text?.append("5")
        }
    }
    
    @IBAction func fourNumber(_ sender: Any) {
        if mainLabel.text == "0"{
            mainLabel.text = "4"
            
        }else{
            mainLabel.text?.append("4")
        }
    }
    
    @IBAction func threeNumber(_ sender: Any) {
        if mainLabel.text == "0"{
            mainLabel.text = "3"
            
        }else{
            mainLabel.text?.append("3")
        }
    }
    @IBAction func twoNumber(_ sender: Any) {
        if mainLabel.text == "0"{
            mainLabel.text = "2"
            
        }else{
            mainLabel.text?.append("2")
        }
    }
    
    @IBAction func oneNumber(_ sender: Any) {
        if mainLabel.text == "0"{
            mainLabel.text = "1"
            
        }else{
            mainLabel.text?.append("1")
        }
    }
    
    @IBAction func zeroNumber(_ sender: Any) {
        if mainLabel.text == "0"{
            mainLabel.text = "0"
            
        }else{
            mainLabel.text?.append("0")
        }
    }
    
}

