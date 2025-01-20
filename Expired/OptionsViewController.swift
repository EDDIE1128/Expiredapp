//
//  OptionsViewController.swift
//  Expired
//
//  Created by 毕然 on 1/19/25.
//

import UIKit

class OptionsViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            print("OptionsViewController loaded successfully.")
            setupKeyboardDismissal()
        }
    private func setupKeyboardDismissal() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true) // This dismisses the keyboard
    }
    @IBAction func navToScan(_ sender: Any) {
        navigateToScanningPage()
    }
    private func navigateToScanningPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let scanningVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            scanningVC.modalPresentationStyle = .fullScreen
            self.present(scanningVC, animated: true, completion: nil)
        }
    }
    


//    private func navigateToInventoryPage() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let inventoryVC = storyboard.instantiateViewController(withIdentifier: "InventoryViewController") as? InventoryViewController {
//            inventoryVC.modalPresentationStyle = .fullScreen
//            self.present(inventoryVC, animated: true, completion: nil)
//        }
//    }
}

