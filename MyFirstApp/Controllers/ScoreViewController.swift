//
//  ScoreViewController.swift
//  MyFirstApp
//
//  Created by Nathalie on 14/07/2023.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var shareResult: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    var quizBrain2 = MultipleChoiceBrain()
    var quizBrain1 = QuizBrain()
   
    
    var trueFalseScore: Int = ScoreManager().trueFalseScore
    var multipleChoiceScore: Int = ScoreManager().multipleChoiceScore

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        view.backgroundColor =  UIColor(red: 50/255, green: 58/255, blue: 90/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
   


    @IBAction func playAgainPressed(_ sender: UIButton) {
        quizBrain1.reset()
        quizBrain2.reset()
        performSegue(withIdentifier: "goToQuestions", sender: self)
    }

    
    @objc func updateUI(){
        
        let finalScore = trueFalseScore + multipleChoiceScore
        let stringScore = String(format: "%d", finalScore)
        print("TS: \(trueFalseScore)")
        print("MS: \(multipleChoiceScore)")
        print("Total: \(finalScore)")

        let attributedString = NSMutableAttributedString(string: "Congratulations! You have successfully completed the quizzler challenge. Your final score is: \n \(stringScore)")
        let boldFont = UIFont.boldSystemFont(ofSize: 60)

        // Set the desired font attributes for the stringScore
        attributedString.addAttributes([NSAttributedString.Key.font: boldFont], range: NSRange(location: attributedString.length - stringScore.count, length: stringScore.count))

        textLabel.attributedText = attributedString

      
        textLabel.textColor = .black
        textLabel.textAlignment = .center

    }
    

}
