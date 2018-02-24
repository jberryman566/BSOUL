//
//  ViewController.swift
//  BSOUL
//
//  Created by  Joshua W Berryman on 2018-02-23.
//  Copyright © 2018  Joshua W Berryman. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    //MARK: PROPERTIES
    
    @IBOutlet weak var nextWorkout: UIDatePicker!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var bsoulLevel: UILabel!
    @IBOutlet weak var bsoulProgress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // set this up so user selects image from their library (ie. profile picture)
        mainImage.image = UIImage(named: "success")

        print(Date())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setWorkout() {
        
        let selectedDate = nextWorkout.date
        scheduleNotification(at: selectedDate)
        /*
        //testttttt
        //this works. Need to adjust the date to a date selector the user picks (ie. pick next workout)
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in }
        let content = UNMutableNotificationContent()
        
        content.title = NSString.localizedUserNotificationString(forKey:
            "Hey There!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey:
            "Its Time to Get BSOUL", arguments: nil)
        
        // Deliver the notification in 60 seconds and repeat it
        content.sound = UNNotificationSound.default()
        //Set trigger to a date picker
        //let date = nextWorkout.date
        
        let calendar = nextWorkout.calendar
        let components = calendar?.dateComponents(in: .current, from: Date())
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components?.month, day: components?.day, hour: components?.hour, minute: components?.minute)
        print(newComponents)
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60,
        //                                                repeats: true)
        // Schedule the notification.
        let request = UNNotificationRequest(identifier: "60_seconds", content: content, trigger: trigger)
        center.add(request, withCompletionHandler: nil)
     */
    }
    
    func scheduleNotification(at date: Date) {
        print("made it to the schedule method")
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: date)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "Tutorial Reminder"
        content.body = "Just a reminder to read your tutorial over at appcoda.com!"
        content.sound = UNNotificationSound.default()
        
        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }
}

