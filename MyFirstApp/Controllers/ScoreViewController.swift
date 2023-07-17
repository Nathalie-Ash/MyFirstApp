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
   
    
    var trueFalseScore: Int = 0
    var multipleChoiceScore: Int = 0

    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func updateUI(){

      
        let finalScore = trueFalseScore + multipleChoiceScore
        let stringScore = String(format: "%d", finalScore)
        print("TS: \(trueFalseScore)")
        print("MS: \(multipleChoiceScore)")
        print("Total: \(finalScore)")
//        var message = ""
//        if finalScore > 15 {
//            message = "Congratulations! You are very smart."
//        } else if finalScore < 10 {
//            message = "You can learn more general knowledge."
//        }



        let attributedString = NSMutableAttributedString(string: "Congratulations! You have successfully completed the quizzler challenge. Your final score is: \n \(stringScore)")
        let boldFont = UIFont.boldSystemFont(ofSize: 60)

        // Set the desired font attributes for the stringScore
        attributedString.addAttributes([NSAttributedString.Key.font: boldFont], range: NSRange(location: attributedString.length - stringScore.count, length: stringScore.count))

        // Assign the attributed string to the textLabel
        textLabel.attributedText = attributedString

        // Adjust other properties of the textLabel as needed
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        





        
    }
    

}
