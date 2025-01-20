//
//  LoginViewController.swift
//  Expired
//
//  Created by 毕然 on 1/19/25.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
        errorLabel.textColor = .red
        errorLabel.isHidden = true
        passwordTextField.isSecureTextEntry = true // Ensure secure input
        setupKeyboardDismissal()
    }
    
    private func setupKeyboardDismissal() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true) // This dismisses the keyboard
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
//        let email = emailTextField.text ?? ""
//        let password = passwordTextField.text ?? ""
        
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        print("Email entered: \(email)")
        print("Password entered: \(password)")
        
        
        // Perform basic validation
        if email.isEmpty || password.isEmpty {
            errorLabel.text = "Please fill in all fields."
            errorLabel.isHidden = false
            return
        }
        
        // Example login authentication logic
        if email == "test@example.com" && password == "password123" {
            errorLabel.isHidden = true
            navigateToOptionsPage()
        } else {
            errorLabel.text = "Invalid credentials. Try again."
            errorLabel.isHidden = false
        }
    }
    
    private func navigateToOptionsPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let optionsVC = storyboard.instantiateViewController(withIdentifier: "OptionsViewController") as? OptionsViewController {
            optionsVC.modalPresentationStyle = .fullScreen // Optional: Make it full-screen
            self.present(optionsVC, animated: true, completion: nil)
        }
        print("Navigating to Options Page...")

    }
    

    
//    private func navigateToMainPage() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let mainVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
//            mainVC.modalPresentationStyle = .fullScreen
//            self.present(mainVC, animated: true, completion: nil)
//        }
//    }
    
    
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        navigateToRegisterPage()
    }
    
    
    private func navigateToRegisterPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let registerVC = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            registerVC.modalPresentationStyle = .fullScreen // Optional: Full-screen presentation
            self.present(registerVC, animated: true, completion: nil)
        }
    }
    


    
    
    

}

