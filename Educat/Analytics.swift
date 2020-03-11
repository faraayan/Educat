//
//  Analytics.swift
//  Educat
//
//  Created by Fara Yan on 10/31/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit
class Analytics: UIViewController{
    
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var studyLabel: UILabel!
    @IBOutlet weak var recTimeLabel: UILabel!
    @IBOutlet weak var percentofMasteryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    var termsMissed = 0
    var charCount = 0
    var avgCharCount = 0.0
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        introLabel.text = "Mastery understanding of " + foldersName[whichFolder]
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let daysCountingYear = (year-flashcardsYearCreated[whichFolder])*365
        let daysCountingMonth = (month-flashcardsMonthCreated[whichFolder])*30
        let daysCountingDay = day-flashcardsDayCreated[whichFolder]
        var daysSinceCreation = daysCountingYear + daysCountingMonth + daysCountingDay
        
        termsMissed = 0
        charCount = 0
        avgCharCount = 0.0
        for element in remembered[whichFolder]{
            if element == -1{
                termsMissed+=1
            }else if element == 0{
                termsMissed+=1
            }
        }
        for definition in flashcardsDef[whichFolder] {
            charCount += definition.count
        }
        for term in flashcardsTerm[whichFolder] {
            charCount += term.count
        }
        if flashcardsTerm.count > 0{
            avgCharCount = Double(Double(charCount)/Double(flashcardsTerm[whichFolder].count))
        }
        if daysSinceCreation <= 0{
            daysSinceCreation = 1
        }
        let numOfRepititions = 3.0/Double(daysSinceCreation)
        let minToRead = Double(charCount)/600
        let additionalMinToRead = Double(termsMissed)*(avgCharCount/Double(600))
        let numOfMinutes = round(Double(numOfRepititions * minToRead + additionalMinToRead)*Double(100.0))
        if (numOfMinutes / 100).isNaN{
            recTimeLabel.text = "0.00"
        }
        else{
            recTimeLabel.text = String(Double(numOfMinutes/100))
        }
        if flashcardsTerm[whichFolder].count > 0 {
            percentofMasteryLabel.text = String(Int(CGFloat(flashcardsTerm[whichFolder].count - termsMissed)/CGFloat(flashcardsTerm[whichFolder].count)*100.00))
            
        }else{
            percentofMasteryLabel.text = "0"
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
