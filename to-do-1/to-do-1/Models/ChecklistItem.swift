//
//  ChecklistItem.swift
//  to-do1
//
//  Created by Hyunju Kim
//

import Foundation

class ChecklistItem {
    var text: String
    var checked: Bool
    
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
    }
    
    convenience init(text: String) {
        self.init(text: text, checked: false)
    }
    
    func toggleChecked() {
        self.checked = !self.checked
    }
}
