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
var hello = 0
let foldersNameKey = "foldersName!"

func saveData(){
    UserDefaults.standard.set(foldersName,forKey: foldersNameKey)
    UserDefaults.standard.set(flashcardsTerm,forKey:"theEventT")
    UserDefaults.standard.set(flashcardsDef,forKey:"theEventD")
    UserDefaults.standard.set(remembered,forKey:"remembered")
    UserDefaults.standard.set(flashcardsDayCreated,forKey:"flashcardDay")
    UserDefaults.standard.set(flashcardsMonthCreated,forKey:"flashcardMonth")
    UserDefaults.standard.set(flashcardsYearCreated,forKey:"flashcardYear")
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
}

class Folders: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var folderTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return foldersName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell2 = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        foldersName = UserDefaults.standard.object(forKey: foldersNameKey) as! [String]
        cell2.textLabel?.text = foldersName[indexPath.row]
        return cell2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        folderTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        whichFolder = indexPath.row
        performSegue(withIdentifier: "segueFolder", sender: self)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        if hello == 0{
            createData()
        }
        saveData()
        createData()
        folderTable.backgroundColor = UIColor.lightGray
        if hello == 1{
            userDataF = true
        }
        if userDataF == false{
            UserDefaults.standard.set(foldersName, forKey: foldersNameKey)
            hello = 1
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
