//
//  QuizViewController.swift
//  MyFirstApp
//
//  Created by Nathalie on 13/07/2023.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var MultipleChoiceButton: UIButton!
    
    @IBOutlet weak var displayScore: UIButton!
    var quizBrain = QuizBrain()

    var timer  = Timer()
  
    var sharedScore = ScoreManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        MultipleChoiceButton.isHidden = true
        displayScore.isHidden = true
        updateUI()
       
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userCorrect = quizBrain.checkAnswer(userAnswer)
        if userCorrect{
            sender.backgroundColor = UIColor.green
        

            
        }else{
            sender.backgroundColor = UIColor.red
        }
        
      //  let isLastQuestion = quizBrain.getQuestionNumber()
        
        quizBrain.nextQuestion()

       
        if quizBrain.flag {
           // print("PLEASEEEE")
            MultipleChoiceButton.isHidden = false
            displayScore.isHidden = false
                 questionLabel.text = "Congratulations! You just finished the True or False section"
                 trueButton.isHidden = true
                 falseButton.isHidden = true
        }else{
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
         
         
       
   
    }
    
 
    @IBAction func displayScorePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToScore", sender: self)
    }
    
    @IBAction func MultipleChoiceButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToMultiple", sender: self)
    }
    
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        sharedScore.trueFalseScore = quizBrain.getScore() 
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToScore" {
            if let destinationVC = segue.destination as? ScoreViewController {
                // Pass the score data to the destination view controller
                destinationVC.trueFalseScore = sharedScore.trueFalseScore
                destinationVC.multipleChoiceScore = sharedScore.multipleChoiceScore
            }
        }
    }

}
