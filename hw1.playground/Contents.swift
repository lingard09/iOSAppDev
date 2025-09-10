import UIKit

//Task #1: Submit your updated code for Q2, Q4, and Q5 in Exercise #1.
//
//* Your code for Q2 should use a ternary conditional operator.
//
//* Your code for Q4 should use the reversed() method.
//
//* Your code for Q5 should use the .last property.
//

// Q2
var num: Int
var qty: Double
var good: Bool

func getTotal (num: Int, qty: Double, good: Bool) -> Double {
    let num = Double(num)
    var total: Double
    total = good ? num*qty*1.5 : num*qty
    return total
}
getTotal(num: 10, qty: 2.5, good: true)

// Q4

// Q5


//Task #2: Submit your code for the Optional exercise.
//An acronym is formed by taking the initial characters of the words in a phrase and combining them into a single word. For example, RAM is an acronym for “random access memory”. Write a function that takes a phrase and returns its acronym. The acronym should be in all uppercase letters, even if the words in the phrase are not capitalized.
//
//* Assume that a space is used as the delimiter between the words in the phrase.
//
//* Use the string's first property and a ternary conditional operator in the function.
