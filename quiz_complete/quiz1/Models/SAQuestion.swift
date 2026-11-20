//
//  SAQuestion.swift
//  quiz1
//
//  Created by kinnwonjin on 12/2/25.
//

import Foundation

class SAQuestion: Question {
    var caseSensitive: Bool
    
    init(text: String, answer: String, caseSensitive: Bool, points: Int) {
        self.caseSensitive = caseSensitive
        super.init(text: text, answers: [answer], rightAnswerInx: 0, points: points)
      
    }
    
    func isCaseSensitive() -> Bool {
        return self.caseSensitive
    }
    
    func setCaseSensitive(caseSensitive: Bool) {
        self.caseSensitive = caseSensitive
    }
}

