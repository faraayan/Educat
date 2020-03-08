//
//  Notifications.swift
//  Educat
//
//  Created by Fara Yan on 10/30/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit
import UserNotifications

class Notifications: UIViewController {
    
    @IBOutlet weak var studyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pastNotificationSetting: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelNotification(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveNotificationTime(_ sender: Any){
        let center = UNUserNotificationCenter.current()

        //Notification message
        let content = UNMutableNotificationContent()
        content.title = "Let's review!"
        content.body = "Stay on track with memorizing your study sets"
        
        //Store notification time
        let selectedDate = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let dateFormattedString = dateFormatter.string(from: selectedDate)
        
        notificationTime = dateFormattedString.components(separatedBy: ":")
        UserDefaults.standard.set(notificationTime, forKey: "notificationTime")
        
        let gregorian = Calendar(identifier: .gregorian)
        var components = gregorian.dateComponents([.hour, .minute, .second], from: Date())
        components.hour = Int(notificationTime[0])
        components.minute = Int(notificationTime[1])
        notificationTime[2] = "0"
        components.second = Int(notificationTime[2])
        
        //Create daily notification
        let notificationDate = gregorian.date(from: components)!
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: notificationDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        let request = UNNotificationRequest(identifier:"segueN", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        center.add(request) { (error) in
        
        }
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad(){
        super.viewDidLoad()
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if notificationTime.count>1{
            if Int(notificationTime[0])!>12{
                pastNotificationSetting.text = "(Your notifications are currently set for " + String(Int(notificationTime[0])!-12) + ":" + String(notificationTime[1]) + "PM)"
            }else{
                pastNotificationSetting.text = "(Your notifications are currently set for " + String(notificationTime[0]) + ":" + String(notificationTime[1]) + "AM)"
            }
        }else{
            pastNotificationSetting.text = ""
        }
    }
}
