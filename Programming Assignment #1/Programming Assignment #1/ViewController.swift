//
//  ViewController.swift
//  Programming Assignment #1
//
//  Created by kinnwonjin on 10/13/25.
//
//  This is a quiz app where users look at pictures and guess what the object is and how many there are. If the user fails to guess the object correctly or enters an incorrect number, it displays “Incorrect.” Pressing the retry button allows them to try again. If the user enters the correct answer, it displays “Correct.”
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var QImage: UIImageView!
    @IBOutlet var numLabel: UILabel!
    @IBOutlet var numStepper: UIStepper!
    @IBOutlet var answerField: UITextField!
    @IBOutlet var resultButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        answerField.delegate = self
        numLabel.text = "0"
        // Do any additional setup after loading the view.
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
    
    @IBAction func numStepper(_ sender: UIStepper){
        numLabel.text = Int(sender.value).description
    }
    
    @IBAction func submit(_ sender: UIButton){
        guard let answer =  answerField.text else {
            return
        }
        
        guard let num =  numLabel.text else {
            return
        }
        
        if resultButton.currentTitle == "Retry" {
            subLabel.text = "What is the picture below,\nand how many are there?"
            QImage.image = UIImage( systemName: "applelogo")
            answerField.text = ""
            numLabel.text = "0"
            resultButton.setTitle("Submit", for: .normal)
            
            return
        }
        
        switch answer.lowercased() {
        case "": return
        case "apple":
            if num == "1"{
                subLabel.text = "Correct"
                QImage.image = UIImage( systemName:  "checkmark.circle")
                resultButton.setTitle("Submit", for: .disabled)
            }
            else {
                subLabel.text = "Incorrect"
                QImage.image = UIImage( systemName:  "x.circle")
                resultButton.setTitle("Retry", for: .normal)
            }

        default:
            subLabel.text = "Incorrect"
            QImage.image = UIImage( systemName:  "x.circle")
            resultButton.setTitle("Retry", for: .normal)
        }
        
        subLabel.adjustsFontSizeToFitWidth = true
                
    }
}

