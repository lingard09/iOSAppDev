//
//  QuestionBank.swift
//  quiz1
//
//  Created by kinnwonjin on 12/2/25.
//

import Foundation
import UIKit

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
        addTFQuestion(questionText: "An instance is an object in Java", answer: true, info: "info info info...", points: 2)
        addSAQuestion(questionText: "_ concatenates two strings.", answer: "+", caseSensitive: false, points: 3)
        addMCQuestion(
            questionText: "What is the capital of France?",
            choices: ["London", "Berlin", "Paris", "Madrid"],
            answerIndex: 2,
            points: 7
        )
        addMCQuestion(
            questionText: "Which of the following is NOT a programming language?",
            choices: ["Swift", "Python", "HTML", "Java"],
            answerIndex: 2,
            points: 8
        )
        addMCQuestion(
            questionText: "What does OOP stand for?",
            choices: ["Object-Oriented Programming", "Objective Operational Process", "Only One Program", "Open Output Protocol"],
            answerIndex: 0,
            points: 9
        )
    }
    
    
    mutating func addTFQuestion(questionText: String, answer: Bool, info: String, points: Int) {
        let q = TFQuestion(text: questionText, rightAnswer: answer, points: points, info: info)
        questions.append((QuestionType.trueFalse, q))
    }
    
    mutating func addSAQuestion(questionText: String, answer: String, caseSensitive: Bool, points: Int) {
        let q = SAQuestion(text: questionText, answer: answer, caseSensitive: caseSensitive, points: points)
        questions.append((QuestionType.shortAnswer, q))
    }
    
    mutating func addMCQuestion(questionText: String, choices: [String], answerIndex: Int, points: Int) {
        let q = MCQuestion(text: questionText, choices: choices, answerIndex: answerIndex, points: points)
        questions.append((QuestionType.multipleChoice, q))
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
    
    func getTFAnswer(i: Int) -> Bool?  {
        guard let q = questions[i].q as? TFQuestion else {
            return nil
        }
        return q.getTFAnswer()
    }
    
    func getSAAnswer(i: Int) -> String {
        return questions[i].q.getRightAnswer()
    }
    
    func getMCChoices(i: Int) -> [String] {
        guard let q = questions[i].q as? MCQuestion else {
            return []
        }
        return q.getChoices()
    }
    
    func getMCAnswer(i: Int) -> Int {
        guard let q = questions[i].q as? MCQuestion else {
            return -1
        }
        return q.getAnswerIndex()
    }
    
    func getPoints(i: Int) -> Int {
        return questions[i].q.getPoints()
    }
    
    func getTFInformation(i: Int) -> String?  {
        guard let q = questions[i].q as? TFQuestion else {
            return nil
        }
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
    
    mutating func getNewQuiz(num: Int) {
        self.shuffleQuestions()
        guard num <= self.questions.count else {
            return
        }
        let temp = self.questions[0..<num]
        self.questions = Array(temp)
    }
    
    mutating func getSAQuestionsOnly() {
        self.questions = self.questions.filter { $0.t == .shortAnswer }
    }
    
    mutating func getMCQuestionsOnly() {
        self.questions = self.questions.filter { $0.t == .multipleChoice }
    }
}
