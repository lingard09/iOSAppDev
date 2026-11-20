//
//  SAQuestionViewController.swift
//  quiz1
//
//  Created by kinnwonjin on 12/2/25.
//
//  Displays a short answer question with a text field for user input.
//  Shows current score and progress, validates that an answer is entered,
//  then sends the trimmed answer back to the delegate and dismisses itself.

import UIKit

class SAQuestionViewController: UIViewController {

    @IBOutlet weak var SAquizText: UILabel!
    @IBOutlet weak var SAanswerTextField: UITextField!
    @IBOutlet weak var SAscoreLabel: UILabel!
    @IBOutlet weak var SAprogressLabel: UILabel!
    
    var questionIndex: Int = 0
    var quiz: QuestionBank?
    weak var delegate: UserAnswerDelegate?
    var currentScore: Int = 0
    var totalQuestions: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
        updateLabels()
    }
    
    func displayQuestion() {
        if let quiz = quiz {
            SAquizText.text = quiz.getQuestionText(i: questionIndex)
        }
        SAanswerTextField.text = ""
    }
    
    func updateLabels() {
        if let quiz = quiz {
            SAscoreLabel?.text = "Score: \(currentScore)"
            
            let answeredCount = getAnsweredCount()
            SAprogressLabel?.text = "\(answeredCount + 1)/\(quiz.getNumOfQuestions())"
        }
    }
    
    func getAnsweredCount() -> Int {
        if let quizVC = delegate as?  QuizViewController {
            return quizVC.getAnsweredCount()
        }
        return 0
    }

    @IBAction func SubmitAnswer(_ sender: UIButton) {
        guard let userAnswer = SAanswerTextField.text, !userAnswer.isEmpty else {
            let alert = UIAlertController(title: "No Answer", message: "Please enter an answer", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        let trimmedAnswer = userAnswer.trimmingCharacters(in: .whitespaces)
        delegate?.getUserSAAnswer(answer: trimmedAnswer)
        
        dismiss(animated: true, completion: nil)
    }
}
