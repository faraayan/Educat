
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

    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var studyLabel: UILabel!
    @IBOutlet weak var recTimeLabel: UILabel!
    @IBOutlet weak var percentofMasteryLabel: UILabel!
    
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
        let daysCountingYear = (year-flashcardsYearCreated[whichFolder])*365
        let daysCountingMonth = (month-flashcardsMonthCreated[whichFolder])*30
        
        let daysSinceCreation = daysCountingYear + daysCountingMonth + (day-flashcardsDayCreated[whichFolder])
        print(year)
        print(flashcardsYearCreated[whichFolder])
        print(flashcardsMonthCreated[whichFolder])
        print(String(daysSinceCreation) + "DAYS CREATED")
        if daysSinceCreation<3{
            if Int(flashcardsTerm[whichFolder+1].count) >= 40{
                recTimeLabel.text = "40"
            }
            else if Int(flashcardsTerm[whichFolder].count) >= 5{
                recTimeLabel.text = String(10*(Int(flashcardsTerm[whichFolder].count)/10))
            }else{
                recTimeLabel.text = "5"
            }
        }
        else if daysSinceCreation<14{
            if Int(7*(Int(flashcardsTerm[whichFolder].count)/10)) >= 35{
                recTimeLabel.text = "35"
            }
            else if Int(7*(Int(flashcardsTerm[whichFolder].count)/10)) >= 5{
                recTimeLabel.text = String(10*(Int(flashcardsTerm[whichFolder].count)/10))
            }else{
                recTimeLabel.text = "5"
            }
        }
        else{
            if Int(5*(Int(flashcardsTerm[whichFolder].count)/10)) >= 30{
                recTimeLabel.text = "30"
            }
            else if Int(5*(Int(flashcardsTerm[whichFolder].count)/10)) >= 5{
                recTimeLabel.text = String(10*(Int(flashcardsTerm[whichFolder].count)/15))
            }else{
                recTimeLabel.text = "5"
            }
        }
        for element in remembered[whichFolder]{
            print(String(element) + "ELEMENT")
            print(String(remembered[whichFolder].count) + " COUNT " )
            if element == 1{
                sum+=1
            }
        }
        print(String(sum) + " SUM")
        percentofMasteryLabel.text = String(Int((sum*100)/remembered[whichFolder].count))
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
