//
//  TFQuestionViewController.swift
//  quiz1
//
//  Created by kinnwonjin on 12/2/25.
//
//  Displays a true/false question with two buttons for user selection.
//  Shows current score and progress, converts button tag to boolean answer,
//  then sends the answer back to the delegate and dismisses itself.

import UIKit

class TFQuestionViewController: UIViewController {

    @IBOutlet weak var TFquizText: UILabel!
    @IBOutlet weak var TFscoreLabel: UILabel!
    @IBOutlet weak var TFprogressLabel: UILabel!
    
    var questionIndex: Int = 0
    var quiz: QuestionBank?
    weak var delegate: UserAnswerDelegate?
    var currentScore: Int = 0
    var totalQuestions: Int = 0
    
    enum TrueFalse: Int {
        case falseButton = 0
        case trueButton = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
        updateLabels()
    }
    
    func displayQuestion() {
        if let quiz = quiz {
            TFquizText.text = quiz.getQuestionText(i: questionIndex)
        }
    }
    
    func updateLabels() {
        if let quiz = quiz {
            TFscoreLabel?.text = "Score: \(currentScore)"
            
            let answeredCount = getAnsweredCount()
            TFprogressLabel?.text = "\(answeredCount + 1)/\(quiz.getNumOfQuestions())"
        }
    }
    
    func getAnsweredCount() -> Int {
        if let quizVC = delegate as? QuizViewController {
            return quizVC.getAnsweredCount()
        }
        return 0
    }

    @IBAction func userAnswer(_ sender: UIButton) {
        var answer: Bool = false
        
        switch sender.tag {
        case TrueFalse.trueButton.rawValue:
            answer = true
        case TrueFalse.falseButton.rawValue:
            answer = false
        default:
            return
        }
        
        delegate?.getUserTFAnswer(answer: answer)
        
        dismiss(animated: true, completion: nil)
    }
}
