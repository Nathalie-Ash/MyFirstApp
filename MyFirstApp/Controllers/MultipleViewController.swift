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
    var quizBrain = MultipleChoiceBrain()
    var sharedScore = ScoreManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
       
    }
  
    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userCorrect = quizBrain.checkAnswer(userAnswer)
        if userCorrect{
            sender.backgroundColor = UIColor.green
            
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
         
        
        if quizBrain.flag {
        
            performSegue(withIdentifier: "goToScorePage", sender: self)
            
        }else{
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
    }
    
    @objc func updateUI(){
        MultipleChoiceTextLabel.text = quizBrain.getQuestionText()
        //print("Test: \(quizBrain1.getScore())")
        sharedScore.multipleChoiceScore = quizBrain.getScore()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        let answerChoices = quizBrain.getAnswers()
        choiceA.setTitle(answerChoices[0], for: .normal)
        choiceB.setTitle(answerChoices[1], for: .normal)
        choiceC.setTitle(answerChoices[2], for: .normal)
        choiceA.backgroundColor = UIColor.clear
        choiceB.backgroundColor = UIColor.clear
        choiceC.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        
        
     
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToScorePage" {
            if let destinationVC = segue.destination as? ScoreViewController {
                // Pass the score data to the destination view controller
                destinationVC.multipleChoiceScore = sharedScore.multipleChoiceScore
            }
        }
    }

    }
    

