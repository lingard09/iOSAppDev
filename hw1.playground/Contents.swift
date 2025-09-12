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
func getTotal (num: Int, qty: Double, good: Bool) -> Double {
    let num = Double(num)
    var total: Double
    total = good ? num*qty*1.5 : num*qty
    return total
}
getTotal(num: 10, qty: 2.5, good: true)

// Q4
func upsideDown (word: String) -> String {
    var upsideDown_word = String(word.reversed())
    return upsideDown_word
}
upsideDown(word: ".nwod edispu si sihT")

// Q5
func isLastDigitSame (num1: Int, num2: Int) -> String {
    var string_num1 = String(num1)
    var string_num2 = String(num2)
    
    var arr_num1 = Array(string_num1)
    var arr_num2 = Array(string_num2)
    
    var last_of_num1 = arr_num1.last
    var last_of_num2 = arr_num2.last
    
    var result = last_of_num1 == last_of_num2 ? true : false
    
    return result == true ? "same" : "not same"
}

isLastDigitSame(num1: 10, num2: 100)


//Task #2: Submit your code for the Optional exercise.
//
//An acronym is formed by taking the initial characters of the words in a phrase and combining them into a single word. For example, RAM is an acronym for “random access memory”. Write a function that takes a phrase and returns its acronym. The acronym should be in all uppercase letters, even if the words in the phrase are not capitalized.
//
//* Assume that a space is used as the delimiter between the words in the phrase.
//
//* Use the string's first property and a ternary conditional operator in the function.

func makeAcronym (word: String) -> String {
    var arr = Array(word)
    var word_length = word.count
    var acronym_arr : [Character] = [" "]
    
    acronym_arr[0] = word.first!
    
    for i in 1...word_length {
        arr[i-1] == " " ? acronym_arr.append(arr[i]) : ()
    }
    
    var result = String(acronym_arr).uppercased()
    
    return result
}
makeAcronym(word: "random access memory")


