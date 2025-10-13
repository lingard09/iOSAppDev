//
//  ViewController.swift
//  dice game 2
//
//  Created by kinnwonjin on 10/9/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var diceImage: UIButton!
    @IBOutlet var numButtons: [UIButton]!
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    
    var numString:[String] = []
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for b in numButtons {
            if let s = b.currentTitle{
                numString.append(s)
            }
        }
        counterLabel.text = "Counter: 0"
    }
    
    @IBAction func rollDice(_ sender: UIButton) {
        let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
        let rdDice = Int.random(in: 1...6)
        counter += 1
        
        sender.setImage(UIImage(named:diceImages[rdDice-1]), for: .normal)
        counterLabel.text = "Counter: \(counter)"
    }
    
    @IBAction func flipNumber(_ sender: UIButton) {
        if let pos = numButtons.firstIndex(of: sender){
            let str = numString[pos]
            
            if let num = sender.currentTitle{
                if num == str{
                    sender.setTitle("", for: .normal)
                    sender.backgroundColor = .darkGray
                }else{
                    sender.setTitle(str, for: .normal)
                    sender.backgroundColor = .clear
                }
            }
        }
    }
    
    @IBAction func resetButtons(_ sender: UIButton) {
        counter = 0
        diceImage.setImage(UIImage(named:"dice1"), for: .normal)
        counterLabel.text = "Counter: \(counter)"
        for i in numString.enumerated() {
            numButtons[i.0].setTitle(i.1, for: .normal)
            numButtons[i.0].backgroundColor = .clear
        }
    }
}


