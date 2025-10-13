import UIKit

//Q1
extension Int {
    subscript (i: Int) -> Int {
        var mul = 1
        for _ in 0..<i {
            mul *= 10
        }
        
        var num = self
        for _ in 0..<i {
            num /= 10
        }
        let digit = num % 10
                
        return digit * mul
    }
}
let x = 1234
print(x[0], x[1], x[2], x[3], separator: " | ")

//Q2
func SumAndProduct(arr: [Int]) -> (Int, Int){
    var sum = 0
    var product = 1
    for e in arr.enumerated() {
        sum += e.element
        product *= e.element
    }
    return(sum, product)
}
var random_array: [Int] = []
for _ in 1...10 {
    random_array.append(Int.random(in: 1...10))
}
let result = SumAndProduct(arr: random_array)
print("Sum:", result.0, "Product:", result.1)

//Q3
func FreqOfWord(arr: [String]) -> [(String, Int)]{
    var result: [(String, Int)] = []
    var t:(String, Int)

    for word in arr {
        var flag = false
        for i in 0..<result.count {
            if(word == result[i].0){
                result[i].1 += 1
                flag = true
                break
            }
        }
        if(flag == false){
            t.0 = word
            t.1 = 1
            result.append(t)
        }
    }
    return result
}
let test = ["one", "two", "three", "one", "one", "two", "three", "one", "one", "two", "three", "one", "one", "two", "three", "one", "one", "two", "three", "one"]
print(FreqOfWord(arr: test))

//Q4
func LoShuMagicSquare(arr: [[Int]]) -> Bool {
    var result = true
    
    var used = [false, false, false, false, false, false, false, false, false]
        for i in 0...2 {
            for j in 0...2 {
                let n = arr[i][j]
                if n < 1 || n > 9 {
                    return false
                }
                if (used[n-1] == true) {
                    return false
                }
                used[n-1] = true
            }
        }
    
    var sumOfRow = 0
    for i in 0...2{
        var temp = 0
        if(i == 0){
            for j in 0...2 {
                sumOfRow += arr[i][j]
            }
        } else {
            for j in 0...2 {
                temp += arr[i][j]
            }
            if(sumOfRow != temp) {
                result = false
            }
        }
    }
    
    var sumOfCol = 0
    for j in 0...2{
        var temp = 0
        if(j == 0){
            for i in 0...2 {
                sumOfCol += arr[i][j]
            }
        } else {
            for i in 0...2 {
                temp += arr[i][j]
            }
            if(sumOfCol != temp) {
                result = false
            }
        }
    }
    
    var sumLeftDia = 0
    for i in 0...2 {
        sumLeftDia += arr[i][i]
    }
    
    var sumRightDia = 0
    for i in 0...2 {
        sumRightDia += arr[i][2-i]
    }
    
    if sumOfRow != sumOfCol || sumOfRow != sumLeftDia || sumOfRow != sumRightDia {
        result = false
    }

    
    return result

}

print(LoShuMagicSquare(arr: [[4, 9, 2], [3, 5, 7], [8, 1, 6]]))
print(LoShuMagicSquare(arr: [[8, 1, 6], [3, 5, 7], [4, 9, 2]]))
print(LoShuMagicSquare(arr: [[2, 7, 6], [9, 5, 1], [4, 3, 8]]))

