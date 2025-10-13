//
//  QuizViewController_old.swift
//  quiz1
//
//  Created by kinnwonjin on 11/4/25.
//

import UIKit

class QuizViewController_old: UIViewController {
    
    @IBOutlet weak var quizText: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    enum TrueFalse: Int {
        case trueButton
        case falseButton
    }
    
//    var quiz = QuestionBank(pointsPerQ: 10)
    var quiz = QuestionBank()
    var numOfQuestions = 0
    var score = 0 {
        didSet { // property observer
            scoreLabel.adjustsFontSizeToFitWidth = true
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var questionNum = 0 {
        didSet { // will set
            progressLabel.adjustsFontSizeToFitWidth = true
            progressLabel.text = "\(questionNum) of \(numOfQuestions)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        numOfQuestions = quiz.getNumOfQuestions()
//        getNextQuestion()
        
        quiz = loadData()
        quiz.setPointsPerQ(p: 10)
        startQuiz()
//        quiz.readQuestions()
        NotificationCenter.default.addObserver(self, selector: #selector(saveData), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc func saveData() {
        do {
            let quizData = try JSONEncoder().encode(quiz)
            
            UserDefaults.standard.set(quizData, forKey: "quiz")
            print("saved quiz")
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadData() -> QuestionBank{
        print("printing quiz")
        var temp = QuestionBank()
        
        if let quizData = UserDefaults.standard.data(forKey: "quiz") {
            do {
                let quizItems = try
                JSONDecoder().decode(QuestionBank.self, from: quizData)
                temp = quizItems
            } catch {
                print(error.localizedDescription)
            }
        }
        return temp
    }

    @IBAction func userAnswer(_ sender: UIButton) {
        switch sender.tag {
        case TrueFalse.trueButton.rawValue:
//                print("true")
            checkAnswer(true)
        case TrueFalse.falseButton.rawValue:
//                print("false")
            checkAnswer(false)
        default: print("default")
        }
    }
    
    @IBAction func getInfo(_ sender: UIButton) {
//        print("Button pressed")
//        
//        let infoVC = P_InfoViewController()
//
//        infoVC.setInfoText(s: "This is info")
//        present(infoVC, animated: true)
        self.performSegue(withIdentifier: "toInfoVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInfoVC" {
            let destination = segue.destination as!
            InfoViewController
//            InfoViewController as UIViewController
//            as ?
            
            destination.loadViewIfNeeded()
            destination.setInfoText(s: quiz.getInformation(i: questionNum - 1))
        }
    }
    
    func getNextQuestion() {
        if questionNum < numOfQuestions {
            quizText.text = quiz.getQuestionText(i: questionNum)
            questionNum += 1
        } else {
//            quizText.text = "End of Quiz"
//            1. create UIAlert
//            2. create acitons
//            3. add those actions to the controller
//            4. present controller
            let alert = UIAlertController(title:"End of Quiz", message: "Done!", preferredStyle: .alert)
            let alertRestart = UIAlertAction(title: "Start Again", style: .default) { _ in
                self.score = 0
                self.questionNum = 0
                self.numOfQuestions = self.quiz.getNumOfQuestions()
                self.quiz.shuffleQuestions()
                self.getNextQuestion()
            }
            let alertQuit = UIAlertAction(title: "Quit", style: .default) { UIAlertAction in
                self.quizText.text = "Your score is \(self.score)"
            }
            alert.addAction(alertRestart)
            alert.addAction(alertQuit)
            
            present(alert, animated: true)
            
        }
    }
    
    func checkAnswer(_ a: Bool) {
        if questionNum <= numOfQuestions {
            let correctA = quiz.getAnswer(i: questionNum - 1)
            score = a == correctA ? score + quiz.getPointsPerQ() : score - quiz.getPointsPerQ()
            
            getNextQuestion()
        }
    }
    
    func startQuiz() {
        score = 0
        questionNum = 0
        numOfQuestions = quiz.getNumOfQuestions()
        quiz.shuffleQuestions()
        getNextQuestion()
    }
}

