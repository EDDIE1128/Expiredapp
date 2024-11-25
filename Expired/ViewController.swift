//
//  ViewController.swift
//  Expired
//
//  Created by 毕然 on 11/10/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {



    
    @IBOutlet weak var Imageview: UIImageView!
    @IBOutlet weak var classLabel: UILabel!
    
    
    
    @IBOutlet weak var ConfidenceLabel: UILabel!
    
    
    @IBAction func Picbutton(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            imagePickerController.allowsEditing = false
            present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                Imageview.image = image
                classifyImage(image: image)
            }
            dismiss(animated: true, completion: nil)
        }
    
    func classifyImage(image: UIImage) {
        guard let url = URL(string: "http://10.0.0.136:5000/classify") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        let imageData = image.jpegData(compressionQuality: 0.8)!
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        request.httpBody = body

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            // Parse the response
            if let result = try? JSONSerialization.jsonObject(with: data) as? [String: String],
               let classification = result["classification"],
               let confidence = result["confidence"],
               let savedPath = result["saved_path"]{
                DispatchQueue.main.async {
                    self.showClassificationResult(classification: classification, confidence: confidence, savedPath: savedPath)
                }
            }
        }
        task.resume()
    }

//    func showClassificationResult(classification: String, savedPath: String) {
//        let alert = UIAlertController(
//            title: "Classification Result",
//            message: "Class: \(classification)\nSaved at: \(savedPath)",
//            preferredStyle: .alert
//        )
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
    func showClassificationResult(classification: String, confidence: String, savedPath: String) {
        classLabel.text = "Class: \(classification)"
        ConfidenceLabel.text = "Confidence: \(confidence)"
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }

}

