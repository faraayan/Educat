
//
//  SetStudyTimer.swift
//  CleverStudy
//
//  Created by Fara Yan on 10/31/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit
class SetStudyTimer: UIViewController{
    
    var minutes = 0
    var sum = 0
    var timer = Timer()
    var understand = 0
    var notUnderstand = 0
    var studyTime = 1.0

    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var studyLabel: UILabel!
    @IBOutlet weak var recTimeLabel: UILabel!
    @IBOutlet weak var percentofMasteryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var percentLabel: UILabel!
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
        print(flashcardsYearCreated)
        print(flashcardsMonthCreated)
        print(flashcardsDayCreated)
        print(whichFolder)
        print(flashcardsTerm)
        print(flashcardsDef)
        print(remembered)
        let daysCountingYear = (year-flashcardsYearCreated[whichFolder])*365
        let daysCountingMonth = (month-flashcardsMonthCreated[whichFolder])*30
        let daysCountingDay = day-flashcardsDayCreated[whichFolder]
        let daysSinceCreation = daysCountingYear + daysCountingMonth + daysCountingDay
        print(year)
        print(flashcardsYearCreated[whichFolder])
        print(flashcardsMonthCreated[whichFolder])
        print(String(daysSinceCreation) + "DAYS CREATED")
        for element in remembered[whichFolder]{
            print(String(element) + "ELEMENT")
            print(String(remembered[whichFolder].count) + " COUNT " )
            if element == 1{
                sum+=1
                understand+=1
            }
            if element == -1{
                notUnderstand+=1
            }
        }
        print(String(sum) + " SUM")
        let forgettingCurve = Double(flashcardsTerm[whichFolder].count)-Double(daysSinceCreation)*0.2
        let proficiency = (1.2*Double(notUnderstand))-((1.3*Double(understand))-1.0)
        if(forgettingCurve + proficiency<0){
            studyTime = Double(flashcardsTerm[whichFolder].count)*0.2
        }else{
            studyTime = forgettingCurve + proficiency
        }
        if flashcardsTerm[whichFolder].count == 0{
            percentofMasteryLabel.text = "0"
        }else{
        percentofMasteryLabel.text = String(Int((sum*100)/remembered[whichFolder].count))
        }
        print("lookit" + String(flashcardsTerm[whichFolder].count))
        print(flashcardsTerm)
        if(flashcardsTerm[whichFolder].count == 0){
            studyTime = 0.0
        }
        recTimeLabel.text = String(studyTime)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
