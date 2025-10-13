//
//  Question.swift
//  quiz0
//
//  Created by kinnwonjin on 11/4/25.
//

import Foundation
import UIKit

struct Question {
    let questionText: String
    let answer: Bool
    let information: String
    
    init(questionText: String, answer: Bool, information: String) {
        self.questionText = questionText
        self.answer = answer
        self.information = information
    }
    
    init(pointsPerQ: Int) {
        self.pointsPerQ = pointsPerQ
        
        let qTuples = readQuestions()
        
        for i in 0..<qTuples.count {
            addQuestion(questionText: qTuples[i].0, answer: qTuples[i].1, information: qTuples[i].2)
        }
    }
    
    func getQuestionText() -> String {
        return questionText
    }
    
    func getAnswer() -> Bool {
        return answer
    }
}

struct QuestionBank {
    var questions: [Question] = []
    var pointsPerQ = 0
    
    init(pointsPerQ: Int) {
        self.pointsPerQ = pointsPerQ
        
        addQuestion(questionText: "I am handsome", answer: true, information: "info1")
        addQuestion(questionText: "I am student", answer: true, information: "info2")
        addQuestion(questionText: "I am gimhae boy", answer: true, information: "info3")
    }
    
    mutating func addQuestion(questionText: String, answer: Bool, information: String) {
        let q = Question(questionText: questionText, answer: answer, information: information)
        questions.append(q)
    }
    
    mutating func shuffleQuestions() {
        self.questions = self.questions.shuffled()
    }
    
    mutating func setPointsPerQ(p: Int) {
        pointsPerQ = p
    }
    
    func getPointsPerQ() -> Int {
        return pointsPerQ
    }
    
    func getNumOfQuestions() -> Int {
        return questions.count
    }
    
    func getQuestionText(i: Int) -> String {
        return ""
    }
    
    func getAnswer(i: Int) -> Bool {
        return false
    }
    
    func getInformation(i: Int) -> String {
        return questions[i].getInformation()
    }
    
//    func readQuestions() {
//        let path = Bundle.main.path(forResource: "quizQuestions", ofType: "txt")
//        let str = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
//        print("read from the file...")
//        print(str)
//    }
    
    mutating func readQuestions() -> [(String, Bool, String)] {
        let path = Bundle.main.path(forResource: "quizQuestions", ofType: "txt")
        let str = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        var temp: [(String, Bool, String)] = []
        
        let strArray = str.components(separatedBy: "\n")
        
        temp = strArray.map{
            let q_items = $0.components(separatedBy: "\t")
            return (q_items[0], Bool(q_items[1])!, q_items[2])
        }
        
        return temp
    }
//    call this func in the init of QuestionBank
//    edit the init
    
}
