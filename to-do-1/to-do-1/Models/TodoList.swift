//
//  TodoList.swift
//  to-do1
//
//  Created by Hyunju Kim
//

import Foundation

class TodoList {
    var todos: [ChecklistItem] = []
    
    init() {
        var item = ChecklistItem(text: "Develop an app")
        todos.append(item)
        item = ChecklistItem(text: "Do exercises")
        todos.append(item)
        item = ChecklistItem(text: "Drink water")
        todos.append(item)
        item = ChecklistItem(text: "Walk")
        todos.append(item)
        item = ChecklistItem(text: "Watch 'Stranger Things'")
        todos.append(item)
        
    }
    
    // Create a ChecklistItem, add it to todos, and
    // return the item.
    func addTodo(text: String, checked: Bool) -> ChecklistItem {
        let item = ChecklistItem(text: text, checked: checked)
        todos.append(item)
        return item
    }
}
