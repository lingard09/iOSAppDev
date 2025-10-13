//
//  QuizViewController.swift
//  quiz1
//
//  Created by kinnwonjin on 11/21/25.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var pointLabels: [UILabel]!
    @IBOutlet var questionButtons: [UIButton]!
    
    var quiz = QuestionBank()
    var totalPoints = 0

    var score = 0 {
        didSet {
            scoreLabel.adjustsFontSizeToFitWidth = true
            totalPoints = quiz.getTotalPoints()
            scoreLabel.text = "Score: \(score) / \(totalPoints)"
        }
    }
    
    var currentInx = -1

    
    override func viewDidLoad() {
        super.viewDidLoad()

        quiz.getNewQuiz(num: 5)
        setLabels()
        
        // Do any additional setup after loading the view.
    }
    

    func setLabels() {
        score = 0
        for i in 0 ..< quiz.getNumOfQuestions() {
            pointLabels[i].text = "0/\(quiz.getPoints(i: i))"
            
        }
    }
    
    @IBAction func getQuestion(_ sender: UIButton) {
        currentInx = sender.tag
        switch quiz.getQuestionType(i: currentInx) {
        case .trueFalse:
            print("T/F question")
        case .shortAnswer:
            print("Short Answer Q")
        case .multipleChoice:
            print ("Multiple Choise")
        }
        
    }
    
    @IBAction func resetQuiz(_ sender: UIButton) {
        quiz.getNewQuiz(num: 5)
        setLabels()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
