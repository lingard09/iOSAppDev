//
//  Question.swift
//  quiz0
//
//  Created by Hyunju Kim on 11/4/25.
//

import Foundation
import UIKit

//struct Question: Codable {
//    let questionText: String
//    let answer: Bool
//    let information: String
//    
//    init(questionText: String, answer: Bool, information: String) {
//        self.questionText = questionText
//        self.answer = answer
//        self.information = information
//    }
//    
//    func getQuestionText() -> String {
//        return questionText
//    }
//    
//    func getAnswer() -> Bool {
//        return answer
//    }
//    
//    func getInformation() -> String {
//        return information
//    }
//    
//}

enum QuestionType {
    case trueFalse
    case shortAnswer
    case multipleChoice
}


struct QuestionBank {
    
    
    var questions: [(t: QuestionType, q: Question)] = []
    
    init() {
        addTFQuestion(questionText: "Java is an OO language.", answer: true, info: "This is info...", points: 2)
        addSAQuestion(questionText: "In Java, 2/3 gives _.", answer: "0", caseSensitive: false, points: 5)
        addTFQuestion(questionText: "Swift is OSS.", answer: true, info: "swift.org in 2015.", points: 2)
        addTFQuestion(questionText: "In Swift, an enum can have functions.", answer: true, info: "info info info...", points: 2)
        addSAQuestion(questionText: "In Swift, ? indicates _.", answer: "an optional", caseSensitive: false, points: 5)
        addSAQuestion(questionText: "In Java, the _ operator creates a new object", answer: "new", caseSensitive: true, points: 3)
        addTFQuestion(questionText: "An instance is an object in Java", answer: true, info: "info info info...", points: 2)
        addSAQuestion(questionText: "_ concatenates two strings.", answer: "+", caseSensitive: false, points: 3)
        
    }
    
    
    mutating func addTFQuestion(questionText: String, answer: Bool, info: String, points: Int) {
        let q = TFQuestion(text: questionText, rightAnswer: answer, points: points, info: info)
        questions.append((QuestionType.trueFalse, q))
        
    }
    
    mutating func addSAQuestion(questionText: String, answer: String, caseSensitive: Bool, points: Int) {
        let q = SAQuestion(text: questionText, answer: answer, caseSensitive: caseSensitive, points: points)
        questions.append((QuestionType.shortAnswer, q))
    }
    
    
    func getTotalPoints() -> Int {
        var total = 0
        for t in questions {
            total += t.q.getPoints()
        }
        return total
    }
    
    func getQuestionType(i: Int) -> QuestionType {
        return questions[i].t
    }
    func getQuestionText(i: Int) -> String {
        return questions[i].q.getQuestionText()
    }
    func getTFAnswer(i: Int) -> Bool {
        let q = questions[i].q as! TFQuestion
        return q.getTFAnswer()
        
    }
    
    func getSAAnswer(i: Int) -> String {
        return questions[i].q.getRightAnswer()
    }
    
    func getPoints(i: Int) -> Int {
        return questions[i].q.getPoints()
    }
    
    func getTFInformation(i: Int) -> String {
        let q = questions[i].q as! TFQuestion
        return q.getInformation()
    }
    
    func getAnswers(i: Int) -> [String] {
        return questions[i].q.getAnswers()
    }
    
    mutating func shuffleQuestions() {
        self.questions = self.questions.shuffled()
    }
    
    func getNumOfQuestions() -> Int {
        return questions.count
    }
    
    ///
    ///
    mutating func getNewQuiz(num: Int) {
        var newQuiz = QuestionBank()
        newQuiz.shuffleQuestions()
        let temp = newQuiz.questions[0..<num]
        self.questions = Array(temp)
    }
    
    
}

