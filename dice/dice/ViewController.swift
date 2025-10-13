//
//  ViewController.swift
//  dice
//
//  Created by kinnwonjin on 9/23/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceLabel: UILabel!
    
    @IBOutlet weak var diceImage: UIImageView!

    @IBOutlet weak var clickButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceImage.image = UIImage(named: "dice1")
        diceLabel.text = "Number: 1"
    }
    
    func updateLabel(_ num: Int) {
        let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
        let rdDice = diceImages[num - 1]
        
        switch rdDice {
        case "dice1":
            diceImage.image = UIImage(named: "dice1")
            diceLabel.text = "Number: 1"
        case "dice2":
            diceImage.image = UIImage(named: "dice2")
            diceLabel.text = "Number: 2"
        case "dice3":
            diceImage.image = UIImage(named: "dice3")
            diceLabel.text = "Number: 3"
        case "dice4":
            diceImage.image = UIImage(named: "dice4")
            diceLabel.text = "Number: 4"
        case "dice5":
            diceImage.image = UIImage(named: "dice5")
            diceLabel.text = "Number: 5"
        case "dice6":
            diceImage.image = UIImage(named: "dice6")
            diceLabel.text = "Number: 6"
        default:
            print()
        }
        clickButton.setTitle("Clicked!", for: .normal)
    }
       
   @IBAction func buttonClicked(_ sender: UIButton) {
       let rdNum = Int.random(in: 1...6)
       updateLabel(rdNum)
   }
}

