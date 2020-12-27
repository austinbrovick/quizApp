//
//  QuizViewController.swift
//  quizApp
//
//  Created by Austin Brovick on 12/26/20.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var quiz: Quiz? = nil
    var currentQuestion: Int = 0
    var currentCorrect: Int = 0
    @IBOutlet weak var questionLabel: UITextView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var timer = Timer()
    var secondsRemaining = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
        updateQuiz()
        timeLabel.text = String(secondsRemaining)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answerSelected = sender.titleLabel!.text!
        let question = quiz!.questions![currentQuestion]
        
        if answerSelected == question.correctAnswer {
            currentCorrect += 1
        }
        currentQuestion += 1
        
        if currentQuestion == quiz!.questions!.count {
            self.performSegue(withIdentifier: "finishedQuizSegue", sender: nil)
        } else {
            updateQuiz()
        }
    }
    
    func updateQuiz() {
        let question = quiz!.questions![currentQuestion]
        questionLabel.text = question.question
        let questionNumbers = [0, 1, 2, 3].shuffled()
        button1.setTitle(question.answers[questionNumbers[0]], for: .normal)
        button2.setTitle(question.answers[questionNumbers[1]], for: .normal)
        button3.setTitle(question.answers[questionNumbers[2]], for: .normal)
        button4.setTitle(question.answers[questionNumbers[3]], for: .normal)
        scoreLabel.text = "\(currentCorrect)/\(currentQuestion)"
    }
    
    
    @objc func updateTimeLabel() {
        secondsRemaining -= 1
        timeLabel.text = String(secondsRemaining)
        if secondsRemaining == 0 {
            self.performSegue(withIdentifier: "finishedQuizSegue", sender: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        print("preparing segue")
        
        if segue.identifier == "finishedQuizSegue" {
            if let destinationVC = segue.destination as? FinishedViewController {
                destinationVC.correct = currentCorrect
            }
        }
    }
}
