//
//  ViewController.swift
//  BSOUL
//
//  Created by  Joshua W Berryman on 2018-02-23.
//  Copyright © 2018  Joshua W Berryman. All rights reserved.
//

import UIKit
import UserNotifications
import os

class ViewController: UIViewController, UNUserNotificationCenterDelegate{
    
    struct Notification {
        
        struct Category {
            static let notification = "notification"
        }
        
        struct Action {
            static let workout = "workout"
        }
    }

    
    //MARK: PROPERTIES
    
    @IBOutlet weak var nextSetWorkout: UILabel!
    @IBOutlet weak var nextWorkout: UIDatePicker!
    @IBOutlet weak var bsoulLevel: UILabel!
    @IBOutlet weak var bsoulProgress: UIProgressView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "test2")!)
        
        if (nextSetWorkout.text == "NULL") {
            nextSetWorkout.text = "No Workout Set!"
        }
        // Do any additional setup after loading the view, typically from a nib.
        configureUserNotificationCenter()
        
        //This is for development purposes to reset data
        //resetGameData()
        
        //retrieve saved data
        getXP()
    }
    
    //reset game to defaults
    func resetGameData() {
        
        let defaults = UserDefaults.standard
        let XP = 0
        let level = 1
        let XPneeded = 100
        let oldCap = 0
        defaults.set(XP, forKey: "XP")
        defaults.set(level, forKey: "Level")
        defaults.set(XPneeded, forKey: "XPneeded")
        defaults.set(oldCap, forKey: "oldCap")
    }
    
    //set all xp values
    func getXP() {

        let defaults = UserDefaults.standard
        let XP = defaults.integer(forKey: "XP")
        let level = defaults.integer(forKey: "Level")
        let XPneeded = defaults.integer(forKey: "XPneeded")
        let oldCap = defaults.integer(forKey: "oldCap")
        bsoulLevel.text = String(level)
        bsoulProgress.progress = Float(Float(XP - oldCap) / Float(XPneeded))
    }

    //Sets up the notification action
    private func configureUserNotificationCenter() {
        UNUserNotificationCenter.current().delegate = self
        
        //action for notification
        let actionWorkout = UNNotificationAction(identifier: Notification.Action.workout, title: "Get My Pump Up On!", options: UNNotificationActionOptions.foreground)
        
        let tutorialCategory = UNNotificationCategory(identifier: Notification.Category.notification, actions: [actionWorkout], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([tutorialCategory])
        
    }
    
    // Gets called when notification is tapped
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {

        if (response.actionIdentifier == "workout") {
            //print("You are correct, we selected the button")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.loadWorkout()
        } else {
            nextSetWorkout.text = "You Missed Your Workout!"
        }
        completionHandler()
    }
    
    //Gets called when app is open and recieves notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // set the label with next workout
    @IBAction func setWorkout() {

        let selectedDate = nextWorkout.date
        if (selectedDate > Date()) {
            
            dateHasBeenSet(at: selectedDate)
            scheduleNotification(at: selectedDate)
        } else {
            nextSetWorkout.text = "Cant Set a Workout in The Past!"
        }
    }
   
    // Build notification and request it
    func scheduleNotification(at date: Date) {
        print("made it to the schedule method")
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: date)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "Hey its BSOUL!"
        content.body = "Its Time to Workout!"
        content.categoryIdentifier = Notification.Category.notification
        content.sound = UNNotificationSound.default()
        
        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }

    // Updates the label to display set workout date
    func dateHasBeenSet(at date: Date) {

        let dateformatter = DateFormatter()
        
        dateformatter.dateStyle = DateFormatter.Style.medium
        dateformatter.timeStyle = DateFormatter.Style.short
        
        let dateValue = dateformatter.string(from: date)

        nextSetWorkout.text = "\(dateValue)"
        
        if(nextWorkout.date <= Date()) {
            nextSetWorkout.text = "No Workout Set!"
        }
    }
    

}

