//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Nathalie on 13/07/2023.
//

import UIKit

class LoginViewController: UIViewController {

  
    @IBOutlet weak var userLabel: UITextField!
    
    @IBOutlet weak var passLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func loginPressed(_ sender: UIButton) {
        
    if (userLabel.text != "" && passLabel.text != ""){
        if(userLabel.text == "User" && passLabel.text == "pass123"){
            print("Valid Login")
            performSegue(withIdentifier: "goToMain", sender: self)
        }else{
            showAlert()
            print("Invalid credentials")
        }
    }else{
        showAlert()
        print("Please enter required fields")
    }

   
    }
 
        
    func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "Invalid Username or Password!", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMain" {
        
           // let destinationVC = segue.destination as! QuizViewController
            
            
            
        }
    }
    

}

