//
//  RegisternextViewController.swift
//  Expired
//
//  Created by 毕然 on 1/20/25.
//
import UIKit

class RegisternextViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var freshnessLevelTextField: UITextField!
    @IBOutlet weak var shiftScheduleTextField: UITextField!
    @IBOutlet weak var permissionLevelTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reenterPasswordTextField: UITextField!
    @IBOutlet weak var loginnext: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupKeyboardDismissal()

    }

    private func setupKeyboardDismissal() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true) // This dismisses the keyboard
    }


    // MARK: - Setup UI
    private func setupUI() {
        errorLabel.text = ""
        errorLabel.textColor = .red
        errorLabel.isHidden = true

        passwordTextField.isSecureTextEntry = true
        reenterPasswordTextField.isSecureTextEntry = true
    }

    // MARK: - Actions
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        let freshnessLevel = freshnessLevelTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let shiftSchedule = shiftScheduleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let permissionLevel = permissionLevelTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let reenterPassword = reenterPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        // Validate input
        if freshnessLevel.isEmpty || shiftSchedule.isEmpty || permissionLevel.isEmpty || password.isEmpty || reenterPassword.isEmpty {
            showError(message: "All fields are required.")
            return
        }

        if password != reenterPassword {
            showError(message: "Passwords do not match.")
            return
        }

        // Successful submission
        print("Registration successful!")
        dismissKeyboard()
        errorLabel.isHidden = true
        // Perform any further actions, e.g., send data to a server
        
        navigateToLoginPage()
    }


    @IBAction func login(_ sender: Any) {
        navigateToLoginPage()
    }
    // MARK: - Navigation
    private func navigateToLoginPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)
        } else {
            print("Error: Could not find LoginViewController.")
        }
    }

    // MARK: - Helper Methods
    private func showError(message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }

}

