//
//  MCQuestion.swift
//  quiz1
//
//  Created by kinnwonjin on 12/2/25.
//

import Foundation

class MCQuestion: Question {
    private var choices: [String]
    private var answerIndex: Int
    
    init(text: String, choices: [String], answerIndex: Int, points: Int) {
        self.choices = choices
        self.answerIndex = answerIndex
        super.init(text: text, answers: choices, rightAnswerInx: answerIndex, points: points)
    }
    
    func getChoices() -> [String] {
        return choices
    }
    
    func getAnswerIndex() -> Int {
        return answerIndex
    }
    
    override func getRightAnswer() -> String {
        if answerIndex >= 0 && answerIndex < choices.count {
            return choices[answerIndex]
        }
        return ""
    }
    
    override func getAnswers() -> [String] {
        return choices
    }
}
