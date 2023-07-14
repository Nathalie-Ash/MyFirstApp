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
    
    var quizBrain = QuizBrain()

    var timer  = Timer()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MultipleChoiceButton.isHidden = true
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
        
        quizBrain.nextQuestion()
        if (quizBrain.getQuestionNumber()){
            MultipleChoiceButton.isHidden = false
        }
       
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
   
    }
    
 

    @IBAction func MultipleChoiceButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToMultiple", sender: self)
    }
    
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
       
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToMultiple" {

    
            }
        }
}
