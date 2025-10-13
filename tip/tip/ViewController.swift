//
//  ViewController.swift
//  tip
//
//  Created by kinnwonjin on 10/17/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var amountField: UITextField!
    @IBOutlet var percentBtns: [UIButton]!
    @IBOutlet var percentField: UITextField!
    @IBOutlet var calBtn: UIButton!
    @IBOutlet var resultLabel : UILabel!
    @IBOutlet var resetBt: UIButton!
    
    var amount: Float = 0.0
    var percentArr: [Int] = [15, 20, 25]
    var percent: Int = 0
    var tip: Float = 0
    var total: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        amountField.delegate = self
        percentField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        guard let text = textField.text else {
            print("nil")
            return false
        }
        let temp = text == "" ? false : true
        return temp
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
    
    func formatCurrency(_ amount: Float) -> String { // outside resourse
        let formatter = NumberFormatter() // numberformatter is one of iOS/Swift classes that can change number to currency or percent. so it makes people easy to read the number.
        formatter.numberStyle = .currency // type of number style
        formatter.currencySymbol = "$" // type of currency symbol
        formatter.maximumFractionDigits = 2 // maximum fraction digits
        return formatter.string(from: NSNumber(value: amount)) ?? "$0.00" // change amount's type from float to NSNumber object because numberformatter needs object type.
    }
    
    func calculateTip(_ amount: Float, _ percent: Int) {
        tip = amount * Float(percent) / 100
        total = amount + tip
        resultLabel.text = "Tip: \(formatCurrency(tip))\nTotal: \(formatCurrency(total))"
    }
    
    @IBAction func percentBtn(_ sender: UIButton) {
        guard let amountText = amountField.text, let amountValue = Float(amountText) else {
            return
        }
        amount = amountValue
    
        for (index, btn) in percentBtns.enumerated() {
                if sender == btn {
                    percent = percentArr[index]
                }
            }
        
        calculateTip(amount, percent)
    }
    
    @IBAction func cal(_ sender: UIButton) {
        guard
            let amountText = amountField.text, let amountValue = Float(amountText),
            let percentText = percentField.text, let percentValue = Int(percentText)
        else {
            return
        }
        
        amount = amountValue
        percent = percentValue
        
        calculateTip(amount, percent)
    }

    @IBAction func reset(_ sender: UIButton) {
        view.endEditing(true) // outside resource, it can end editing in all textfields.

        amount = 0.0
        percent = 0
        tip = 0.0
        total = 0.0
        amountField.text = ""
        percentField.text = ""
        resultLabel.text = "Tip: \nTotal:"
    }

}

