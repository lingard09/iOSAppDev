//
//  TFQuestion.swift
//  quiz1
//
//  Created by kinnwonjin on 12/2/25.
//

import Foundation

class TFQuestion: Question {
    var information: String
    
    init(text: String, rightAnswer: Bool, points: Int, info: String) {
        self.information = info
        super.init(text: text, answers: ["true", "false"], rightAnswerInx: rightAnswer ? 0 : 1, points: points)
        
    }
    
    func setInformation(info: String) {
        self.information = info
    }
    
    func getInformation() -> String {
        return self.information
    }
    
    func getTFAnswer() -> Bool {
        let ans = super.getRightAnswer()
        if ans == "true" {
            return true
        } else {
            return false
        }
    }
}
