//
//  Folders.swift
//  CleverStudy
//
//  Created by Fara Yan on 10/28/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit

var whichFolder = 0
var userDataF = false
var foldersName: [String] = []
var userData = false
var whichFlashcard = 0
var flashcardsTerm: [[String]] = []
var flashcardsDef: [[String]] = []
var flashcardsDayCreated: [Int] = []
var flashcardsMonthCreated: [Int] = []
var flashcardsYearCreated: [Int] = []
var remembered: [[Int]] = []
var isSavedFolder = false
var folderHeaderHeight: CGFloat { 10.0 }
let foldersNameKey = "foldersName!"

var dailyLog: [[Bool]] = []

var notificationTime: [String] = [""]

func saveData(){
    UserDefaults.standard.set(foldersName,forKey: foldersNameKey)
    UserDefaults.standard.set(flashcardsTerm,forKey:"theEventT")
    UserDefaults.standard.set(flashcardsDef,forKey:"theEventD")
    UserDefaults.standard.set(remembered,forKey:"remembered")
    UserDefaults.standard.set(flashcardsDayCreated,forKey:"flashcardDay")
    UserDefaults.standard.set(flashcardsMonthCreated,forKey:"flashcardMonth")
    UserDefaults.standard.set(flashcardsYearCreated,forKey:"flashcardYear")
    
    UserDefaults.standard.set(dailyLog, forKey: "dailyLog")
    
    UserDefaults.standard.set(notificationTime, forKey: "notificationTime")
}


func createData(){
    foldersName = UserDefaults.standard.object(forKey: foldersNameKey) as? [String] ?? []
    flashcardsTerm = UserDefaults.standard.object(forKey: "theEventT") as? [[String]] ?? []
    flashcardsDef = UserDefaults.standard.object(forKey: "theEventD") as? [[String]] ?? []
    remembered = UserDefaults.standard.object(forKey: "remembered") as? [[Int]] ?? []
    userDataF = UserDefaults.standard.bool(forKey: "userDataF")
    flashcardsDayCreated = UserDefaults.standard.object(forKey: "flashcardDay") as? [Int] ?? []
    flashcardsMonthCreated = UserDefaults.standard.object(forKey: "flashcardMonth") as? [Int] ?? []
    flashcardsYearCreated = UserDefaults.standard.object(forKey: "flashcardYear") as? [Int] ?? []
    dailyLog = UserDefaults.standard.object(forKey: "dailyLog") as? [[Bool]] ?? []
    notificationTime = UserDefaults.standard.object(forKey: "notificationTime") as? [String] ?? [""]
}

class Folders: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var folderTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return foldersName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        foldersName = UserDefaults.standard.object(forKey: foldersNameKey) as! [String]
        
        //Adjust folder cell interface
        guard let tableFont = UIFont(name: "Avenir-Light", size: 20) else {
            fatalError("""
                Failed to load the "CustomFont-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        cell.textLabel?.font = UIFontMetrics.default.scaledFont(for: tableFont)
        cell.textLabel?.text = foldersName[indexPath.row]
        cell.backgroundColor = UIColor(named: "mainColor")
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ran")
        folderTable.reloadData()
        
        //reset dailyLog if it's monday
        if getWeekday() == 3{
            if dailyLog.count != 0{
                for i in 0 ... (dailyLog.count-1){
                    for j in 0 ... 6{
                        dailyLog[i][j] = false
                    }
                }
            }
            UserDefaults.standard.set(dailyLog, forKey: "dailyLog")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        whichFolder = indexPath.row
        performSegue(withIdentifier: "segueFolder", sender: self)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        if isSavedFolder == false{
            createData()
            button.isHidden = true
        }
        saveData()
        createData()
        if isSavedFolder == true{
            userDataF = true
        }
        if userDataF == false{
            UserDefaults.standard.set(foldersName, forKey: foldersNameKey)
            isSavedFolder = true
        }
        folderTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete{
            flashcardsDef.remove(at: indexPath.row)
            flashcardsTerm.remove(at: indexPath.row)
            remembered.remove(at: indexPath.row)
            foldersName.remove(at: indexPath.row)
            saveData()
        }
        folderTable.reloadData()
    }
}
