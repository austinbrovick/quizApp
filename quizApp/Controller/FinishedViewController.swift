//
//  FinishedViewController.swift
//  quizApp
//
//  Created by Austin Brovick on 12/26/20.
//

import UIKit

class FinishedViewController: UIViewController {
        
    
    @IBOutlet weak var finishedLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var correct: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishedLabel.text = "Good job!"
        scoreLabel.text = "\(correct!)/10"
        // Do any additional setup after loading the view.
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
        
        if segue.identifier == "restartQuizSegue" {
            if let destinationVC = segue.destination as? QuizViewController {
                destinationVC.quiz = QuizBuilder().createQuiz()
            }
        }
        
    }
    
}
