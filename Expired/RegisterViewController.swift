//
//  RegisterViewController.swift
//  Expired
//
//  Created by 毕然 on 1/19/25.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // Outlets for text fields and error label
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var contactnumber: UITextField!
    @IBOutlet weak var storeaddress: UITextField!
    @IBOutlet weak var role: UITextField!
    @IBOutlet weak var employeeid: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    

    // Set up UI (hide error label, style text fields)
    private func setupUI() {
        errorLabel.isHidden = true
        errorLabel.textColor = .red
        
//        // Style text fields with rounded corners and padding
//        [usernameTextField, emailTextField, fullname, contactnumber, storeaddress, role,  employeeid].forEach {
//            $0?.layer.cornerRadius = 10
//            $0?.layer.borderWidth = 1
//            $0?.layer.borderColor = UIColor.lightGray.cgColor
//            $0?.setLeftPaddingPoints(10) // Adds padding inside the text fields
//        }
    }
    
    // Action for the Login button (navigates back to Login Page)
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        navigateToLoginPage()
    }
    
    // Action for the submit button
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let fullname = fullname.text ?? ""
        let contactnumber = contactnumber.text ?? ""
        let storeaddress = storeaddress.text ?? ""
        let role = role.text ?? ""
        let employeeid = employeeid.text ?? ""
        
        
        // Validation: Check if all fields are filled
        if username.isEmpty || fullname.isEmpty || contactnumber.isEmpty || email.isEmpty ||
            storeaddress.isEmpty || role.isEmpty ||
            employeeid.isEmpty{
            showError(message: "All fields are required.")
            return
        }
        
        navigateToLoginPage()
        
    }
    
    // Display an error message
    private func showError(message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    
    
    @IBAction func RegisterNext(_ sender: Any) {
        navigateToNextPage()
    }
    
    private func navigateToNextPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let optionsVC = storyboard.instantiateViewController(withIdentifier: "RegisternextViewController") as? RegisternextViewController {
            optionsVC.modalPresentationStyle = .fullScreen // Optional: Make it full-screen
            self.present(optionsVC, animated: true, completion: nil)
        }
        print("Navigating to Options Page...")
        
    }
    
    
    // Navigate back to the login page
    private func navigateToLoginPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)
        } else {
            print("Error: Could not find LoginViewController.")
        }
    }
    
    // Helper extension to add padding inside text fields
//    extension UITextField {
//        func setLeftPaddingPoints(_ amount: CGFloat) {
//            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
//            self.leftView = paddingView
//            self.leftViewMode = .always
//        }
//    }
}
