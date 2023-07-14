//
//  Question.swift
//  MyFirstApp
//
//  Created by Nathalie on 13/07/2023.
//


import Foundation


struct Question {
    
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
