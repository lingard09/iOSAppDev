//
//  ViewController.swift
//  dice
//
//  Created by kinnwonjin on 9/23/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var comImage: UIImageView!
    
    @IBOutlet weak var comLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var diceImage: UIImageView!
    
    @IBOutlet weak var clickButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        comLabel.text = "-"
        diceImage.image = UIImage(named: "dice1")
        resultLabel.text = "-"
    }
    
    func whoIsWinner(_ com: Int, _ user: Int) -> Character{
        let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
        let rdDice = diceImages[user - 1]
        diceImage.image = UIImage(named: rdDice)
        var winner: Character
        
        comLabel.text = "Computer: \(com)"
        
        switch rdDice {
        case "dice1":
            winner = com > 1 ? "c" : "d"
        case "dice2":
            if (com > 2){
                winner = "c"
            } else if (com == 2){
                winner = "d"
            } else {
                winner = "u"
            }
        case "dice3":
            if (com > 3){
                winner = "c"
            } else if (com == 3){
                winner = "d"
            } else {
                winner = "u"
            }
        case "dice4":
            if (com > 4){
                winner = "c"
            } else if (com == 4){
                winner = "d"
            } else {
                winner = "u"
            }
        case "dice5":
            if (com > 5){
                winner = "c"
            } else if (com == 5){
                winner = "d"
            } else {
                winner = "u"
            }
        case "dice6":
            winner = com == 6 ? "d" : "u"
        default:
            print()
        }
        clickButton.setTitle("Clicked!", for: .normal)
        
        return winner;
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let rdCom = Int.random(in: 1...6)
        let rdUser = Int.random(in: 1...6)
        let winner = whoIsWinner(rdCom, rdUser)
        switch winner {
        case "c":
            resultLabel.text = "You lose!"
        case "u":
            resultLabel.text = "You win!"
        case "d":
            resultLabel.text = "You draw!"
        default:
            break
        }
    }
}

