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
        
        let content = UNMutableNotificationContent()
        content.title = "Hey, it's time to review!"
        content.body = ":)"
        
        let selectedDate = timeOfNotification.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let dateFormattedString = dateFormatter.string(from: selectedDate)
        print(dateFormattedString)
        var myStringArr = dateFormattedString.components(separatedBy: ":")
        // Step 3: Create the notification trigger
        let gregorian = Calendar(identifier: .gregorian)
        let now = Date()
        var components = gregorian.dateComponents([.hour, .minute, .second], from: now)
        components.hour = Int(myStringArr[0])
        components.minute = Int(myStringArr[1])
        myStringArr[2] = "0"
        components.second = Int(myStringArr[2])
        UserDefaults.standard.set(myStringArr, forKey: "NotificationTime")
        print(myStringArr)
        
        let date = gregorian.date(from: components)!
        
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        
        let request = UNNotificationRequest(identifier:"segueN", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print("INSIDE NOTIFICATION")
        
        center.add(request) { (error) in
            // Check the error parameter and handle any errors
        
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
