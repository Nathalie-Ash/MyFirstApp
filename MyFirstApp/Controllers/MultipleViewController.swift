//
//  MultipleViewController.swift
//  MyFirstApp
//
//  Created by Nathalie on 13/07/2023.
//

import UIKit

class MultipleViewController: UIViewController {
    
    @IBOutlet weak var MultipleChoiceTextLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiceC: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var timer  = Timer()
    var quizBrain2 = MultipleChoiceBrain()
    var quizBrain1 = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       
    }
  
    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userCorrect = quizBrain2.checkAnswer(userAnswer)
        if userCorrect{
            sender.backgroundColor = UIColor.green
            
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain2.nextQuestion()
         
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        MultipleChoiceTextLabel.text = quizBrain2.getQuestionText()
        //print("Test: \(quizBrain1.getScore())")
        scoreLabel.text = "Score: \(quizBrain2.getScore()+quizBrain1.getScore())"
        let answerChoices = quizBrain2.getAnswers()
        choiceA.setTitle(answerChoices[0], for: .normal)
        choiceB.setTitle(answerChoices[1], for: .normal)
        choiceC.setTitle(answerChoices[2], for: .normal)
        choiceA.backgroundColor = UIColor.clear
        choiceB.backgroundColor = UIColor.clear
        choiceC.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain2.getProgress()
     
    }
}
