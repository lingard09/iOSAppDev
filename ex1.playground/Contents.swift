import UIKit

//Q1
func leapYear(year: Int) -> String {
    if(year % 4 == 0){
        if(year % 100 != 0) {
            return "leap"
        } else {
            if(year % 400 == 0) {
                return "leap"
            } else {
                return "not leap"
            }
        }
    } else {
        return "not leap"
    }
}

leapYear(year: 2024)
leapYear(year: 2000)
leapYear(year: 1900)
leapYear(year: 2025)

//Q2

//Q3
func starMatrix(N: Int, M: Int) {
    for i in 1...M {
        for j in 1...N {
            print("*", terminator: "")
        }
        print("\n", terminator: "")
    }
}
starMatrix(N: 7, M:4)

//Q4
func upsideDown(word: String){
    var arr = Array(word)
    var len = arr.count
    var rev: [Character] = []
    
    for i in len...1 {
        rev.append(arr[i])
    }
    var rev_word = String(rev)
    print(rev_word)
    
}
upsideDown(word: ".ih")

//Q5
