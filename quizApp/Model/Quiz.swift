//
//  Quiz.swift
//  quizApp
//
//  Created by Austin Brovick on 12/25/20.
//

import Foundation

struct Quiz {
    
    var questions: [Question]? = nil
    var currentQuestion: Int? = nil
    
    init(_ questions: [Question]) {
        self.questions = questions
    }
}
