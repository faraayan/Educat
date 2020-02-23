//
//  Notifications.swift
//  CleverStudy
//
//  Created by Fara Yan on 10/30/19.
//  Copyright © 2019 Fara Yan. All rights reserved.
//

import UIKit
import UserNotifications

var myStringArr = [String()]

class Notifications: UIViewController {
    @IBOutlet weak var studyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeOfNotification: UIDatePicker!

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveNotificationTime(_ sender: Any){
        let center = UNUserNotificationCenter.current()
        
        //Notification message
        let content = UNMutableNotificationContent()
        content.title = "Let's review!"
        content.body = "Stay on track with memorizing your study sets"
        
        //Store notification time
        let selectedDate = timeOfNotification.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let dateFormattedString = dateFormatter.string(from: selectedDate)
        var myStringArr = dateFormattedString.components(separatedBy: ":")
        let gregorian = Calendar(identifier: .gregorian)
        var components = gregorian.dateComponents([.hour, .minute, .second], from: Date())
        components.hour = Int(myStringArr[0])
        components.minute = Int(myStringArr[1])
        myStringArr[2] = "0"
        components.second = Int(myStringArr[2])
        UserDefaults.standard.set(myStringArr, forKey: "NotificationTime")
        
        //Create daily notification
        let date = gregorian.date(from: components)!
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
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
    
}
