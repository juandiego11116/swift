import UIKit

let  alphabets = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    //The number of letters in alphabet equals 26

var stringa: String = ""

while stringa.count < 6 {
    stringa.append(alphabets.randomElement()!)
}
let password = stringa

print(password)





//let numbers = [45, 73, 195, 53, 53, 12]
//
//
//let computedNumbers = numbers.enumerated().map { (index, number) in
//
//    if let firstElement = numbers.first {
//        if numbers.count - 1  == index {
//            return number * firstElement
//        }else{
//
//            return number * numbers[index+1]
//        }
//
//    }
//    return 0
//
//
//} as [Int]
//print(computedNumbers)


    
    
    
    
    
    


