import UIKit

// private
// fileprivate
// internal
// public
// open

// structure
// structure is value type
// if want to update value, use mutaining keyword
struct QuizQuestion{
    let question = ""
    let answer: String
    
    init() {
        answer = ""
    }
}

let q1 = QuizQuestion()

struct QuizQuestion1{
    let question = ""
    let answer = ""
}

let q = QuizQuestion1()

struct QuizQuestion2{
    let question: String
    let answer: Bool
    
    init(question: String) {
        self.question = question
        self.answer = true
    }
    
    init(_ q: String, _ a: Bool) {
        question = q
        answer = a
    }
}

//let q3 = QuizQuestion2() - error

struct QuizQuestion4{
    let question: String
    let answer: Bool
}

var q4 = QuizQuestion4(question: "3+2 = 5", answer: false) // memberwize initializer
//q4 = QuizQuestion4() - missing arguments
