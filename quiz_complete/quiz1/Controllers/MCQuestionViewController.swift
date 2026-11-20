//
//  MCQuestionViewController.swift
//  quiz1
//
//  Created by kinnwonjin on 12/2/25.
//
//  Displays a multiple-choice question with up to 4 answer choices.
//  Shows current score and progress, then sends the selected answer
//  back to the delegate (QuizViewController) and dismisses itself.

import UIKit

class MCQuestionViewController: UIViewController {

    @IBOutlet weak var MCquizText: UILabel!
    @IBOutlet weak var MCscoreLabel: UILabel!
    @IBOutlet weak var MCprogressLabel: UILabel!
    
    @IBOutlet var choiceButtons: [UIButton]!
    
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
        guard let quiz = quiz else { return }
        
        MCquizText.text = quiz.getQuestionText(i: questionIndex)
        
        let choices = quiz.getMCChoices(i: questionIndex)
        for (index, button) in choiceButtons.enumerated() {
            if index < choices.count {
                button.setTitle(choices[index], for: .normal)
                button.isHidden = false
                button.tag = index  // 버튼의 tag를 선택지 인덱스로 설정
            } else {
                button.isHidden = true
            }
        }
    }
    
    func updateLabels() {
        if let quiz = quiz {
            MCscoreLabel?.text = "Score: \(currentScore)"
            
            let answeredCount = getAnsweredCount()
            MCprogressLabel?.text = "\(answeredCount + 1)/\(quiz.getNumOfQuestions())"
        }
    }
    
    func getAnsweredCount() -> Int {
        if let quizVC = delegate as? QuizViewController {
            return quizVC.getAnsweredCount()
        }
        return 0
    }

    @IBAction func choiceButtonTapped(_ sender: UIButton) {
        let selectedIndex = sender.tag
        
        delegate?.getUserMCAnswer(answerIndex: selectedIndex)
        
        dismiss(animated: true, completion: nil)
    }
}
