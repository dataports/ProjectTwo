//
//  ViewController.swift
//  ProjectTwo/Users/774261/Desktop/Projects/ProjectTwo/ProjectTwo/ViewController.swift
//
//  Created by Sophia Amin on 4/16/18.
//  Copyright © 2018 Sophia Amin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Properties
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var clickLabel: UILabel!
    @IBOutlet weak var addedStringLabel: UILabel!
    
    let firstThread = DispatchQueue(label: "first")
    let secondThread = DispatchQueue(label: "second")
    let thirdThread = DispatchQueue(label: "third")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func addingStringsAlertButton(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Hello", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter First String"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Second String"
        }

        
        // SAVE BUTTON
        let saveAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { alert -> Void in
            let alertTxtFieldString1 = alertController.textFields![0] as UITextField
            let alertTxtFieldString2 = alertController.textFields![1] as UITextField
          
            
            let alertString1 = alertTxtFieldString1.text
            let alertString2 = alertTxtFieldString2.text
          
            
            print("Result saveAction: \(String(describing: alertString1!)), Price: \(String(describing: alertString2!)))")
//
            //TODO: CONCATENATE STRINGS
            self.addedStringLabel.text = alertString1! + " " + alertString2!
            
//            self.saveDataFromAlert(newColor:alertColor!, newPrice:alertPrice!, newType:alertType!)
        })
        
        // CANCEL BUTTON
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func concurrencyButton(_ sender: UIButton) {
        
        startMultiThreading()
        
    }
    
    
    //MARK: functions
    func startMultiThreading(){
        firstThread.async {
            for index in 1...6{
                print("My 😱 index \(index)")
            }
        }
        
        for index in 1...6{
            print("My 🤠 index \(index)")
        }
        
       secondThread.async {
            for index in 1...6{
                print("My 😅 index \(index)")
            }
        }
        
        thirdThread.sync {
            for index in 1...6{
                print("My 🤢 index \(index)")
            }
        }
    }

    
}

