//
//  ViewController.swift
//  CleverStudy
//
//  Created by Fara Yan on 10/27/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit

var symbol = [String]()
var redColor = UIColor(red:1.00, green:0.93, blue:0.93, alpha:1.0)
let greenColor = UIColor(red:0.96, green:1.00, blue:0.92, alpha:1.0)
var heyThere = 0
var sectionHeaderHeight: CGFloat { 5.0 }

class Flashcards: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var flashcardLabelName: UILabel!
    @IBOutlet weak var flashcardTable: UITableView!

    @IBAction func analytics(_ sender: Any) {
        performSegue(withIdentifier: "analytics", sender: self)
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
        
        //Assign corresponding color for each cell
        symbol = []
        for elements in remembered[whichFolder]{
            if elements == -1{
                symbol.append("  •")
            }
            else{
                symbol.append(" ")
            }
        }
        cell.textLabel?.text = String(cell.textLabel!.text!) + symbol[indexPath.row % symbol.count]
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        flashcardTable.reloadData()
        saveData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        whichFlashcard = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
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
        if heyThere == 1{
            userDataF = true
        }
        if userData == false{
            saveData()
            heyThere = 1
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
