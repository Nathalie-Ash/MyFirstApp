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
        scoreLabel.accessibilityIdentifier = "scoreLabel"
        questionLabel.accessibilityIdentifier = "quesLabel"
        trueButton.accessibilityIdentifier = "trueButton"
        falseButton.accessibilityIdentifier = "falseButton"
        super.viewDidLoad()
        MultipleChoiceButton.isHidden = true
        displayScore.isHidden = true
        updateUI()
        view.accessibilityIdentifier = "QuizView"
        MultipleChoiceButton.accessibilityIdentifier = "MultipleChoiceButton"
        displayScore.accessibilityIdentifier = "finalScoreButton"
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userCorrect = quizBrain.checkAnswer(userAnswer)
        if userCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()

        if quizBrain.flag {
           
            MultipleChoiceButton.isHidden = false
            displayScore.isHidden = false
            questionLabel.text = "Congratulations! You just finished the True or False section"
            trueButton.isHidden = true
            falseButton.isHidden = true
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }

    }
    
 
    @IBAction func displayScorePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToScore", sender: self)
    }
    
    @IBAction func MultipleChoiceButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToMultiple", sender: self)
    }
    
    @objc func updateUI() {
        
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
                destinationVC.trueFalseScore = sharedScore.trueFalseScore
            }
        }
        
        if segue.identifier == "goToMultiple" {
            if let destinationVC = segue.destination as? MultipleViewController{
                destinationVC.trueFalseScoreUpdated = sharedScore.trueFalseScore
            }
        }
    }
}
