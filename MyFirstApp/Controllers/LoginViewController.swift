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
        userLabel.accessibilityIdentifier = "Enter Username"
        passLabel.accessibilityIdentifier = "Enter Password"
        userLabel.delegate = self
        passLabel.delegate = self
    }
    
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if (userLabel.text != "" && passLabel.text != ""){
            if(userLabel.text == "User" && passLabel.text == "pass123") {
                print("Valid Login")
                performSegue(withIdentifier: "goToMain", sender: self)
            } else {
                showAlert()
                print("Invalid credentials")
            }
        } else {
            showAlert()
            print("Please enter required fields")
        }
        
        
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "Invalid Username or Password!", preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(closeAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMain" {
            
            // let destinationVC = segue.destination as! QuizViewController
            
            
            
        }
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
