//
//  MultipleChoiceBrain.swift
//  MyFirstApp
//
//  Created by Nathalie on 13/07/2023.
//

import Foundation


struct MultipleChoiceBrain{
    
    let quizMultiple = [
        MultipleQuestion(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        MultipleQuestion(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        MultipleQuestion(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        MultipleQuestion(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        MultipleQuestion(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        MultipleQuestion(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        MultipleQuestion(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        MultipleQuestion(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        MultipleQuestion(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        MultipleQuestion(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
    ]
    
    var questionNumber = 0
    var score = 0
    var flag = false
    
    mutating func checkAnswer(_ userAnswer: String)-> Bool{
        if (userAnswer == quizMultiple[questionNumber].answer){
            score += 1
            return true
        }else{
            return false
        }
    }
    
    func getAnswers() -> [String] {
        return quizMultiple[questionNumber].choices
    }
    
    
    func getScore()->Int{
        return score
    }
    
    func getQuestionText()-> String{
        return quizMultiple[questionNumber].text
    }
    
    func getProgress() -> Float{
        return Float(questionNumber+1) / Float(quizMultiple.count)
    }
    
    mutating func nextQuestion(){
        if (questionNumber+1 < quizMultiple.count){
            questionNumber += 1
        }else{
            flag = true
        }
    }
    
    mutating func reset() {
        questionNumber = 0
        score = 0
    }
    
}
