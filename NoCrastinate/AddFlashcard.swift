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
    
    @IBAction func saveFlashcard(_ sender: Any) {
        userData = true
        UserDefaults.standard.set(userData, forKey:"userData")
        if termText.text == ""{
            termText.backgroundColor = UIColor.red
        }
        if definitionText.text == ""{
            definitionText.backgroundColor = UIColor.red
        }
        
        if termText.text != "" && definitionText.text != ""{
            termText.backgroundColor = UIColor.white
            definitionText.backgroundColor = UIColor.white
            flashcardsDef[whichFolder].append(definitionText.text!)
            flashcardsTerm[whichFolder].append(termText.text!)
            remembered[whichFolder].append(0)
            saveData()
            dismiss(animated: true, completion:nil)
            
        }
    }
    
    @IBAction func DoneFlashcard(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
     }
 }
