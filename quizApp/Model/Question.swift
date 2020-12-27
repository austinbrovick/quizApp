//
//  Question.swift
//  quizApp
//
//  Created by Austin Brovick on 12/25/20.
//

import Foundation

struct Question {
    
    var question: String
    var answers: [String]
    var correctAnswer: String
    
    init(question: String, answers: [String], correctAnswer: String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
    
}
