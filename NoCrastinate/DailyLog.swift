//
//  DailyLog.swift
//  NoCrastinate
//
//  Created by Fara Yan on 2/25/20.
//  Copyright © 2020 Fara Yan. All rights reserved.
//

import UIKit
import Foundation

//gets the weekday 1-Sunday, 7-Saturday
func getWeekday()->Int{
    let weekday = NSCalendar.current.component(.weekday, from: Date())
    return weekday
}
class DailyLog: UIViewController {
    
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(pressDailyLog(_:)))
    
    @IBAction func pressDailyLog(_ sender: Any) {
        pressed = false
        dismiss(animated: true, completion: nil)
    }
    func boolToText(_ hasReviewed: Bool)-> String{
        if hasReviewed == true{
            return "■"
        }else{
            return "□"
        }
    }
    
    func weekdayToLabel(_ weekday: Int)-> UILabel{
        if weekday == 1{
            return sundayLabel
        }else if weekday == 2{
            return mondayLabel
        }else if weekday == 3{
            return tuesdayLabel
        }else if weekday == 4{
            return wednesdayLabel
        }else if weekday == 5{
            return thursdayLabel
        }else if weekday == 6{
            return fridayLabel
        }else if weekday == 7{
            return saturdayLabel
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for i in 0 ... 6{
            weekdaytoLabel(i+1).text = boolToText(dailyLog[whichFolder][i])
            weekdaytoLabel(i+1).textColor = UIColor(named: "dailyLogColor")
        }
        weekdayToLabel(getWeekday()).textColor = UIColor(named: "titleColor")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
