//
//  MultipleQuestion.swift
//  MyFirstApp
//
//  Created by Nathalie on 13/07/2023.
//

import Foundation
struct MultipleQuestion {
    let text: String
    let choices: [String]
    let answer: String
    
    
    init(q: String, a: [String], correctAnswer: String ){
        text = q
        choices = a
        answer = correctAnswer
    }
}
