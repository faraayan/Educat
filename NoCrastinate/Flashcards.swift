//
//  Flashcards.swift
//  NoCrastinate
//
//  Created by Fara Yan on 10/27/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit

var symbol = [String]()
var isSaved = false
var sectionHeaderHeight: CGFloat { 5.0 }
var pressed = false
var isInStudyMode = false

class Flashcards: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var flashcardLabelName: UILabel!
    @IBOutlet weak var flashcardTable: UITableView!
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(longPressForDailyLog(_:)))
    
    @IBAction func longPressForDailyLog(_ sender: Any) {
        if pressed == false{
            print("thisRan!")
            performSegue(withIdentifier: "toDailyLog", sender: nil)
            pressed = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return flashcardsTerm[whichFolder].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        //Set interface for each cell
        guard let tableFont = UIFont(name: "Avenir-Light", size: 15) else {
            fatalError("""
                Failed to load the "Avenir-Light" font.
                """
            )
        }
        cell.textLabel?.font = UIFontMetrics.default.scaledFont(for: tableFont)
        cell.textLabel?.text = flashcardsTerm[whichFolder][indexPath.row]
        cell.backgroundColor = UIColor(named: "mainColor")
        let margins = UIEdgeInsets(top: 58, left: 0, bottom: 50, right: 0)
        cell.frame = cell.frame.inset(by: margins)
        
        //Assign corresponding label for each cell
        symbol = []
        for elements in remembered[whichFolder]{
            if elements == 1{
                symbol.append(" ")
            }
            else{
                symbol.append(" •")
            }
        }
        cell.textLabel?.text = String(cell.textLabel!.text!) + symbol[indexPath.row % symbol.count]
        
        return cell
    }
    
    @IBAction func studyFlashcards(_ sender: Any) {
        isInStudyMode = true
        whichFlashcard = 0
        performSegue(withIdentifier: "openFlashcardSegue", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(dailyLog)
        dailyLog[whichFolder][getWeekday()-1] = true
        print(dailyLog)
        flashcardTable.reloadData()
        isInStudyMode = false
        saveData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        whichFlashcard = indexPath.row
        performSegue(withIdentifier: "openFlashcardSegue", sender: self)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set interface for Folder title
        guard let titleFont = UIFont(name: "Avenir-Heavy", size: 30) else {
            fatalError("""
                Failed to load the "Avenir-Heavy" font.
                """
            )
        }
        flashcardLabelName.font = UIFontMetrics.default.scaledFont(for: titleFont)
        flashcardLabelName.text = foldersName[whichFolder]
        
        userData = UserDefaults.standard.bool(forKey: "userData")
        if isSaved == true{
            userDataF = true
        }
        if userData == false{
            saveData()
            isSaved = true
        }
        flashcardTable.reloadData()
    }

    @IBAction func closeFlashcards(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete{
                flashcardsDef[whichFolder].remove(at: indexPath.row)
                flashcardsTerm[whichFolder].remove(at: indexPath.row)
                remembered[whichFolder].remove(at: indexPath.row)
                saveData()
            flashcardTable.reloadData()
        }
    }
}
