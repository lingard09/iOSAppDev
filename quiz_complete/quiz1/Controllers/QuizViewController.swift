//
//  QuizViewController.swift
//  quiz1
//
//  Created by kinnwonjin on 12/2/25.
//
//  Main quiz coordinator that manages the quiz flow and scoring.
//  Generates a 5-question quiz, presents different question type VCs
//  (True/False, Short Answer, Multiple Choice), tracks answers and score,
//  automatically moves to next unanswered question, and shows completion alert.

import UIKit
import Foundation

protocol UserAnswerDelegate: AnyObject {
    func getUserTFAnswer(answer: Bool)
    func getUserSAAnswer(answer: String)
    func getUserMCAnswer(answerIndex: Int)
}

class QuizViewController: UIViewController, UserAnswerDelegate {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var pointLabels: [UILabel]!
    @IBOutlet var questionButtons: [UIButton]!
    
    var quiz = QuestionBank()
    var totalPoints = 0
    var answeredQuestions: Set<Int> = []

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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if answeredQuestions.count == quiz.getNumOfQuestions() {
            showCompletionAlert()
        } else {
            moveToNextUnansweredQuestion()
        }
    }
    
    func getUserTFAnswer(answer: Bool) {
        let correctAnswer = quiz.getTFAnswer(i: currentInx)
        let points = quiz.getPoints(i: currentInx)
        
        if answer == correctAnswer {
            score += points
            pointLabels[currentInx].text = "\(points)/\(points)"
        } else {
            pointLabels[currentInx].text = "0/\(points)"
        }
        
        answeredQuestions.insert(currentInx)
    }
    
    func getUserSAAnswer(answer: String) {
        let correctAnswer = quiz.getSAAnswer(i: currentInx)
        let points = quiz.getPoints(i: currentInx)  // 문제의 포인트
        
        if answer.lowercased() == correctAnswer.lowercased() {
            score += points
            pointLabels[currentInx].text = "\(points)/\(points)"
        } else {
            pointLabels[currentInx].text = "0/\(points)"
        }
        
        answeredQuestions.insert(currentInx)
    }
    
    func getUserMCAnswer(answerIndex: Int) {
        let correctIndex = quiz.getMCAnswer(i: currentInx)
        let points = quiz.getPoints(i: currentInx)
        
        if answerIndex == correctIndex {
            score += points
            pointLabels[currentInx].text = "\(points)/\(points)"
        } else {
            pointLabels[currentInx].text = "0/\(points)"
        }
        
        answeredQuestions.insert(currentInx)
    }
    
    func getAnsweredCount() -> Int {
        return answeredQuestions.count
    }
    
    func moveToNextUnansweredQuestion() {
        for i in 0..<quiz.getNumOfQuestions() {
            if !answeredQuestions.contains(i) {
                currentInx = i
                
                switch quiz.getQuestionType(i: currentInx) {
                case . trueFalse:
                    performSegue(withIdentifier: "toTFQuestionVC", sender: self)
                case . shortAnswer:
                    performSegue(withIdentifier: "toSAQuestionVC", sender: self)
                case .multipleChoice:
                    performSegue(withIdentifier: "toMCQuestionVC", sender: self)
                }
                return
            }
        }
    }
    
    func showCompletionAlert() {
        let alert = UIAlertController(
            title: "Quiz Completed! ",
            message: "Your final score is \(score) / \(totalPoints)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Start Again", style: . default) { _ in
            self.resetQuiz(UIButton())
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }

    func setLabels() {
        score = 0
        answeredQuestions.removeAll()
        for i in 0 ..< quiz.getNumOfQuestions() {
            pointLabels[i].text = "0/\(quiz.getPoints(i: i))"
        }
    }
    
    @IBAction func getQuestion(_ sender: UIButton) {
        currentInx = sender.tag
        
        switch quiz.getQuestionType(i: currentInx) {
        case .trueFalse:
            performSegue(withIdentifier: "toTFQuestionVC", sender: self)
        case .shortAnswer:
            performSegue(withIdentifier: "toSAQuestionVC", sender: self)
        case .multipleChoice:
            performSegue(withIdentifier: "toMCQuestionVC", sender: self)
        }
    }
    
    @IBAction func resetQuiz(_ sender: UIButton) {
        quiz.getNewQuiz(num: 5)
        setLabels()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTFQuestionVC" {
            if let tfVC = segue.destination as?  TFQuestionViewController {
                tfVC.questionIndex = currentInx
                tfVC.quiz = quiz
                tfVC.delegate = self
                tfVC.currentScore = score
                tfVC.totalQuestions = quiz.getNumOfQuestions()
            }
        } else if segue.identifier == "toSAQuestionVC" {
            if let saVC = segue.destination as? SAQuestionViewController {
                saVC.questionIndex = currentInx
                saVC.quiz = quiz
                saVC.delegate = self
                saVC.currentScore = score
                saVC.totalQuestions = quiz.getNumOfQuestions()
            }
        } else if segue.identifier == "toMCQuestionVC" {
            if let mcVC = segue.destination as? MCQuestionViewController {
                mcVC.questionIndex = currentInx
                mcVC.quiz = quiz
                mcVC.delegate = self
                mcVC.currentScore = score
                mcVC.totalQuestions = quiz.getNumOfQuestions()
            }
        }
    }
}
