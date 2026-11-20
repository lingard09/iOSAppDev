//
//  Question.swift
//  quiz_classes
//
//  Created by Hyunju Kim
//

import Foundation

class Question {
    //private let type: QuestionType
    final var questionText: String
    var answers: [String]
    var rightAnswerInx: Int
    var points: Int
    
    init(text: String, answers: [String], rightAnswerInx: Int, points: Int) {
        //self.type = type
        self.questionText = text
        self.answers = answers
        self.rightAnswerInx = rightAnswerInx
        self.points = points
    }
    func getQuestionText() -> String {
        return questionText
    }
    
    func getAnswers() -> [String] {
        return answers
    }
    
    func getRightAnswer() -> String {
        return answers[rightAnswerInx]
    }
    
    func getPoints() -> Int {
        return points
    }
    
    func setPoints(newPoints: Int) {
        self.points = newPoints
    }
}



