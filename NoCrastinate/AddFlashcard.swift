 //
//  AddFlashcard.swift
//  CleverStudy
//
//  Created by Fara Yan on 10/27/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit

 class AddFlashcard: UIViewController {
    
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
        }
        if definitionText.text == ""{
            definitionUnderline.textColor = UIColor.red
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        termText.borderStyle = UITextField.BorderStyle.none
        definitionText.borderStyle = UITextField.BorderStyle.none
     }
 }
