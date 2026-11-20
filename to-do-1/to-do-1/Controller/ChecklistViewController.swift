//
//  ViewController.swift
//  to-do-1
//
//  Created by kinnwonjin on 11/28/25.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var todoList = TodoList()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    
    // MARK: table view func
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = todoList.todos[indexPath.row]
        
//        if let label = cell.viewWithTag(100) as? UILabel {
//            if indexPath.row == 0 {
//                label.text = "Do HW"
//            }
//        }
        setLabel(cell: cell, item: item)
        setCheckmark(cell: cell, item: item)
//        if let label = cell.viewWithTag(100) as? UILabel {
//            label.text = item.text
//        }
//        
//        if item.checked {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = todoList.todos[indexPath.row]
            item.toggleChecked()
            setCheckmark(cell: cell, item: item)
            
            tableView.deselectRow(at: indexPath, animated: true)
            
//            if cell.accessoryType == .none {
//                cell.accessoryType = .checkmark
//            } else {
//                cell.accessoryType = .none
//            }
        }
//        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todoList.todos.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    // MARK: IBAction
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let rowInx = todoList.todos.count
        _ = todoList.addTodo(text: "New ToDo", checked: false)
        
        let indexPath = IndexPath(row: rowInx, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    // MARK: other func
    func setCheckmark(cell: UITableViewCell, item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
//        item.toggleChecked()
    }
    
    func setLabel(cell: UITableViewCell, item: ChecklistItem) {
        if let label = cell.viewWithTag(100) as? UILabel {
            label.text = item.text
        }
    }
}

