//
//  ViewController.swift
//  timer0
//
//  Created by kinnwonjin on 10/21/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    let colors: [UIColor] = [.red, .green, .blue, .yellow, .white]
    
    var timer = Timer()
    var player = AVAudioPlayer();
    var time = 0
    var currentTime: Float = 0
    var initialTime: Float = 0
    var isTimerRunning = false

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var bar: UIProgressView!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bar.transform = bar.transform.scaledBy(x: 1.0, y: 3.0)
        bar.layer.cornerRadius = 2.5
        bar.clipsToBounds = true
        
        bar.progress = 1
        
        _ = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @objc func changeColor() {
        view.backgroundColor = colors.randomElement()
    }
    
    @objc func updateTimer() {
        time += 1
        print("passed \(time) times")
        if self.currentTime > 0 {
            self.currentTime -= 1
            self.textField.text = "\(self.currentTime)"
            let progress = currentTime / initialTime
            bar.setProgress(progress, animated: true)
        } else {
            timer.invalidate()
            bar.progress = 0.0
            
            if let url = Bundle.main.url(forResource: "bell", withExtension: "wav") {
                player = try! AVAudioPlayer(contentsOf: url)
                player.play()
            }
        }
    }
    
    @IBAction func start(_ sender: UIButton) {
        if isTimerRunning {
            timer.invalidate()
            isTimerRunning = false
            startBtn.setTitle("pausing", for: .normal)
            player.stop()
            if let url = Bundle.main.url(forResource: "click1", withExtension: "wav") {
                player = try! AVAudioPlayer(contentsOf: url)
                player.play()
            }
            return
        }
        
        guard let text = textField.text, let seconds = Float(textField.text!) else {
            print("nil")
            return
        }
        
        if currentTime == 0 {
            currentTime = seconds
            initialTime = seconds
        }
        
        timer.invalidate()
        bar.progress = currentTime / initialTime
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
        startBtn.setTitle("running", for: .normal)
                
        if let url = Bundle.main.url(forResource: "click1", withExtension: "wav") {
            player = try! AVAudioPlayer(contentsOf: url)
            player.play()
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        timer.invalidate()
        bar.progress = 1.0
        currentTime = initialTime
        textField.text = String(initialTime)
        startBtn.setTitle("Start", for: .normal)
        player.stop()
        
        if let url = Bundle.main.url(forResource: "click2", withExtension: "wav") {
            player = try! AVAudioPlayer(contentsOf: url)
            player.play()
        }
    }
}

