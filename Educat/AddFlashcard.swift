 //
//  AddFlashcard.swift
//  Educat
//
//  Created by Fara Yan on 10/27/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit
import AudioToolbox

 class AddFlashcard: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var termText: UITextField!
    @IBOutlet weak var definitionText: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var termUnderline: UILabel!
    @IBOutlet weak var definitionUnderline: UILabel!
    
    @IBAction func saveFlashcard(_ sender: Any) {
        userData = true
        UserDefaults.standard.set(userData, forKey:"userData")
        if termText.text == ""{
            termUnderline.textColor = UIColor.red
            AudioServicesPlaySystemSound(1519)
        }else{
            termUnderline.textColor = UIColor.black
        }
        if definitionText.text == ""{
            definitionUnderline.textColor = UIColor.red
            AudioServicesPlaySystemSound(1519)
        }else{
            definitionUnderline.textColor = UIColor.black
        }
        
        if termText.text != "" && definitionText.text != ""{
            termUnderline.textColor = UIColor.black
            definitionUnderline.textColor = UIColor.black
            flashcardsDef[whichFolder].append(definitionText.text!)
            flashcardsTerm[whichFolder].append(termText.text!)
            remembered[whichFolder].append(0)
            saveData()
            dismiss(animated: true, completion:nil)
        }
    }
    
    @IBAction func cancelFlashcard(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    //Hides keyboard when return key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        termText.resignFirstResponder()
        definitionText.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        termText.delegate = self
        definitionText.delegate = self
        termText.borderStyle = UITextField.BorderStyle.none
        definitionText.borderStyle = UITextField.BorderStyle.none
     }
 }
