//
//  ViewController.swift
//  dice game 2
//
//  Created by kinnwonjin on 10/9/25.
//

import UIKit
import AVFoundation
// create a player in AVAudioPlayer
// create an url to the sound file
// assign the url to the plater
// play or stop the player

class ViewController: UIViewController {

    @IBOutlet var diceImage: UIButton!
    @IBOutlet var numButtons: [UIButton]!
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    
    var player: AVAudioPlayer!
    
    var timer = Timer()
    var seconds = 0
    
    var numString:[String] = []
    var counter = 0
    var mode = 0
    
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
        mode = 1
        
        timer.invalidate() // 실제 1초 증가
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
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
        mode = 2
    }
    
    @IBAction func resetButtons(_ sender: UIButton) {
        counter = 0
        diceImage.setImage(UIImage(named:"dice1"), for: .normal)
        counterLabel.text = "Counter: \(counter)"
        for i in numString.enumerated() {
            numButtons[i.0].setTitle(i.1, for: .normal)
            numButtons[i.0].backgroundColor = .clear
        }
        mode = 3
        playSound(mode)
    }
    
    func playSound(_ mode: Int) { // playSound(_ mode: Int) - use a switch statement
        var url = Bundle.main.url(forResource: "click1", withExtension: "wav")
        switch mode{
        case 1:
            url = Bundle.main.url(forResource: "click1", withExtension: "wav")
        case 2:
            url = Bundle.main.url(forResource: "click2", withExtension: "wav")
        case 3:
            url = Bundle.main.url(forResource: "bell", withExtension: "wav")
        default:
            url = Bundle.main.url(forResource: "beep", withExtension: "wav")
        }
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        // player.stop()
    }
    
    @objc func updateTimer() {
        print("passed \(seconds) times")
        seconds += 1
    }
}


