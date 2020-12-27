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
    
    var questions: [[String: Any]]? = nil
    var quiz: Quiz? = nil
    
    func getData() {
        let semaphore = DispatchSemaphore(value: 0)
        let session = URLSession.shared
        let url = URL(string: "https://opentdb.com/api.php?amount=10&category=21&type=multiple")!
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print("Error")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Bad status code")
                return
            }
            
            guard let mime = response?.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                
                let results = json["results"] as! [[String: Any]]
                self.questions = results
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        createQuiz()
        print(self.quiz!)
    }
    

    func createQuiz() {
        var processedQuestions: [Question] = []
        for q in questions! {
            var answers = q["incorrect_answers"] as! [String]
            answers.append(q["correct_answer"] as! String)
            processedQuestions.append(Question(question: q["question"] as! String, answers: answers, correctAnswer: q["correct_answer"] as! String))
        }
        
        self.quiz = Quiz(processedQuestions)
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

