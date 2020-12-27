//
//  ViewController.swift
//  quizApp
//
//  Created by Austin Brovick on 12/25/20.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func startQuizPressed(_ sender: Any) {
        print("hello")
    }
    
    
    var quiz: Quiz? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let quizBuilder = QuizBuilder()
        quiz = quizBuilder.createQuiz()
        print(self.quiz!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        print("preparing segue")
        
        if segue.identifier == "startQuizSegue" {
            if let destinationVC = segue.destination as? QuizViewController {
                destinationVC.quiz = quiz
            }
        }
        
    }
    
}

