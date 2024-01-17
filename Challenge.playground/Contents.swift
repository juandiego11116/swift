import UIKit

var width: Float = 1.5
var heigth: Float = 2.3

var bucketsOfPaint: Int{
    get{
        let area = width * heigth
        let roundedBuckets = ceil(area / 1.5)
        return Int(roundedBuckets)
    }
    set{
        let areaCanCovert = Double(newValue) * 1.5
        print("Total to covert is: \(areaCanCovert)")
    }
}

bucketsOfPaint = 3
print(bucketsOfPaint)
