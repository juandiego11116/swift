import Foundation

func fibonacci(n: Int) {
    let actual = 1
    let before = 0
    var array: [Int] = []

    
    array.append(before)
    array.append(actual)
    for number in 2..<n{
        array.append(array[number - 2] + array[number - 1])
    }
    print(array)
    }
fibonacci(n: 5)

