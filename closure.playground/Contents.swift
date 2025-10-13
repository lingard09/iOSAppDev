import UIKit

//Q1: Given the following array, write a function that takes a non-negative integer and returns the corresponding string representation of each digit. For example, if the input is 12, it should return “OneTwo”.
//* In your function, you must handle Optional values properly.
let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
func numToWord(_ num: Int) -> String {
    var str = String(num)
    var result = ""
    for i in str.enumerated() {
        for j in digitNames.enumerated() {
            if(Int(String(i.1))! == j.1.0) {
                result.append(j.1.1)
            }
        }
    }
        return result
}
numToWord(13)

//Q2: Given the following integer array, call the map method on it using the function you wrote in Q1.
let c = [12, 9, 345, 20]
c.map(numToWord)

//Q3: Rewrite your function from Q1 so that it uses Character.wholeNumberValue, which converts a single-digit character to an integer. Because this property may return nil, make sure to handle it properly in your updated function. Then, call this updated function for Q2 and check whether it generates valid outputs.
func numToWord2(_ num: Int) -> String {
    var str = String(num)
    var result = ""
    for i in str.enumerated() {
        for j in digitNames.enumerated() {
            if((i.1).wholeNumberValue == j.1.0) {
                result.append(j.1.1)
            }
        }
    }
        return result
}
c.map(numToWord2)

//Q4: Use the full closure syntax to call the map method on the array.
//
//Q5: Call the map method on the array using the trailing closure syntax.
//
// 
//
//Q6: Rewrite your code from Q5 using compactMap.
//
// 
//
//Q7: Rewrite the code from Q6 using either joined() or reduce(), and try to simplify the resulting code.
