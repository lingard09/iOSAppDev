//
//  ViewController.swift
//  Programming Assignment #2
//
//  Created by kinnwonjin on 11/13/25.
//
//  This is a quiz app where you guess the names and quantities of fruits by looking at pictures. The user views the fruit image displayed on the screen, enters the fruit name, and selects the quantity (via a dropdown button) to answer correctly. Upon answering correctly, the message “Correct!” appears; if incorrect, “Incorrect. Try again!” is displayed, allowing the user to proceed to the next question or retry.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var QImage: UIImageView!
    @IBOutlet var answerField: UITextField!
    @IBOutlet var qtyBtn: UIButton!
    @IBOutlet var goBtn: UIButton!
    
    let fruitArr = ["apple", "pear","strawberry", "grape", "cherry"]
    let qtyArr = [5, 7, 6, 3, 4]
    var selectedQty: String = "1"
    var quizNum = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        answerField.delegate = self
        setupQtyBtn()
        setupFirstQ()
        // Do any additional setup after loading the view.
    }
    
    func setupQtyBtn() {
        let qtys = ["1", "2", "3", "4", "5", "6", "7"]
        let actions = qtys.map { qty in
            UIAction(title: qty) { [weak self] _ in
                self?.selectedQty = qty
                self?.qtyBtn.setTitle(qty, for: .normal)
            }
        }
        
        qtyBtn.menu = UIMenu(title: "Select Quantity", children: actions)
        qtyBtn.showsMenuAsPrimaryAction = true
    }

        
    func setupFirstQ() {
        subLabel.text = "Q. Write fruit name and qty\n(Click number to select qty)"
        QImage.image = UIImage(named: fruitArr[quizNum])
        answerField.text = ""
        goBtn.setTitle("Submit", for: .normal)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        answerField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        guard let answer = answerField.text else {
            print("nil")
            return false
        }
        let temp = answer == "" ? false : true
        return temp
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
    
    @IBAction func submit(_ sender: UIButton){
        guard let answer = answerField.text else {
            return
        }

        let title = goBtn.currentTitle ?? ""

        switch title {
        case "Next":
            nextQ()
        case "Retry":
            retry()
        case "Restart":
            restart()
        default:
            checkAnswer(answer)
        }
    }

    func retry() {
        answerField.text = ""
        selectedQty = "1"
        qtyBtn.setTitle(selectedQty, for: .normal)
        subLabel.text = "Q. Write fruit name and qty\n(Click number to select qty)"
        QImage.image = UIImage(named: fruitArr[quizNum])
        goBtn.setTitle("Submit", for: .normal)
        answerField.becomeFirstResponder()
    }

    func restart() {
        quizNum = 0
        setupFirstQ()
    }

    
    func nextQ() {
        quizNum += 1
        
        if quizNum >= fruitArr.count {
            subLabel.text = "Quiz Completed!"
            QImage.image = UIImage(systemName: "star.fill")
            goBtn.setTitle("Restart", for: .normal)
            return
        }
        
        subLabel.text = "Q. Write fruit name and qty\n(Click number to select qty)"
        QImage.image = UIImage(named: fruitArr[quizNum])
        answerField.text = ""
        selectedQty = "1"
        goBtn.setTitle("Submit", for: .normal)
    }
    
    func checkAnswer(_ answer: String) {
        guard answer != "" else { return }
        
        let correctFruitName = fruitArr[quizNum]
        let correctQty = qtyArr[quizNum]
        
        let isCorrectFruit = answer.lowercased() == correctFruitName.lowercased()
        let isCorrectQty = Int(selectedQty) == correctQty
        
        if isCorrectFruit && isCorrectQty {
            subLabel.text = "Correct!"
            QImage.image = UIImage(systemName: "checkmark.circle")
            goBtn.setTitle("Next", for: .normal)
        } else {
            subLabel.text = "Incorrect. Try again!"
            QImage.image = UIImage(systemName: "x.circle")
            goBtn.setTitle("Retry", for: .normal)
        }
        subLabel.adjustsFontSizeToFitWidth = true
    }
}

