//
//  ScoreManager.swift
//  MyFirstApp
//
//  Created by Nathalie on 14/07/2023.
//

import Foundation

struct ScoreManager {

    
    var trueFalseScore = 0
    var multipleChoiceScore = 0
    
    var totalScore: Int {
           return trueFalseScore + multipleChoiceScore
       }
     
    
}
