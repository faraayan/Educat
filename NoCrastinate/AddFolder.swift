//
//  AddFolder.swift
//  CleverStudy
//
//  Created by Fara Yan on 10/28/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit

func createTime(){
    flashcardsDayCreated = UserDefaults.standard.object(forKey: "flashcardDay") as? [Int] ?? []
    flashcardsMonthCreated = UserDefaults.standard.object(forKey: "flashcardMonth") as? [Int] ?? []
    flashcardsYearCreated = UserDefaults.standard.object(forKey: "flashcardYear") as? [Int] ?? []
}

class AddFolder: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var folderNameText: UITextField!
    @IBOutlet weak var addFolderNav: UINavigationBar!
    @IBOutlet weak var saveFolder: UIButton!
    @IBOutlet weak var underlineBar: UILabel!
    
    @IBAction func saveFolder(_ sender: Any) {
        userDataF = true
        UserDefaults.standard.set(userDataF, forKey:"userDataF")
        whichFolder = flashcardsTerm.count
        if folderNameText.text == ""{
            underlineBar.textColor = UIColor.red
        }
        
        if folderNameText.text != ""{
            underlineBar.textColor = UIColor.black
            foldersName.append(folderNameText.text!)
            flashcardsTerm.append([])
            flashcardsDef.append([])
            remembered.append([])
            saveData()
            let date = Date()
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)
            let month = calendar.component(.month, from: date)
            let year = calendar.component(.year, from: date)
            flashcardsDayCreated.append(day)
            flashcardsMonthCreated.append(month)
            flashcardsYearCreated.append(year)
            UserDefaults.standard.set(flashcardsDayCreated,forKey:"flashcardDay")
            UserDefaults.standard.set(flashcardsMonthCreated,forKey:"flashcardMonth")
            UserDefaults.standard.set(flashcardsYearCreated,forKey:"flashcardYear")
            createTime()
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func cancelFolder(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveFolder.layer.cornerRadius = 8
        folderNameText.borderStyle = UITextField.BorderStyle.none
    }
}


