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
    
    struct Notification {
        
        struct Category {
            static let tutorial = "tutorial"
        }
        
        struct Action {
            static let readLater = "readLater"
        }
    }
    
    //MARK: PROPERTIES
    
    @IBOutlet weak var nextSetWorkout: UILabel!
    @IBOutlet weak var nextWorkout: UIDatePicker!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var bsoulLevel: UILabel!
    @IBOutlet weak var bsoulProgress: UIProgressView!
    //var isSet: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if(nextWorkout.date <= Date()) {
            //nextSetWorkout.text = "No Workout Set!"
            //isSet = false
        //}
        
        if (nextSetWorkout.text == "NULL") {
            nextSetWorkout.text = "No Workout Set!"
        }
        // Do any additional setup after loading the view, typically from a nib.
 
        //configureUserNotificationCenter()
        // set this up so user selects image from their library (ie. profile picture)
        mainImage.image = UIImage(named: "success")
        //print(Date())
        
    }
    /*
    private func configureUserNotificationCenter() {
        UNUserNotificationCenter.current().delegate = self
        
        let actionReadLater = UNNotificationAction(identifier: Notification.Action.readLater, title: "Read Later", options: [])
        
        let tutorialCategory = UNNotificationCategory(identifier: Notification.Category.tutorial, actions: [actionReadLater], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([tutorialCategory])
        
    }
    */
    /*
    func userNotificationCenter(_ center: UNUserNotificationCenter, didRecieve response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
            
        case Notification.Action.readLater:
            print("we are here after notification")
        
        default:
            print("Why am i here all day")
    
        }
    }
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setWorkout() {
        
        let selectedDate = nextWorkout.date
        dateHasBeenSet(at: selectedDate)
        scheduleNotification(at: selectedDate)

    }
    
    func scheduleNotification(at date: Date) {
        print("made it to the schedule method")
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: date)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "Hey its BSOUL!"
        content.body = "Its Time to Workout!"
        //content.categoryIdentifier = Notification.Category.tutorial
        content.sound = UNNotificationSound.default()
        
        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }
    
    func dateHasBeenSet(at date: Date) {
        
        //let calendar = Calendar(identifier: .gregorian)
        //let components = calendar.dateComponents(in: .current, from: date)
        //let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        let dateformatter = DateFormatter()
        
        dateformatter.dateStyle = DateFormatter.Style.medium
        dateformatter.timeStyle = DateFormatter.Style.short
        
        let dateValue = dateformatter.string(from: date)
        
        if(nextWorkout.date > Date()) {
            //isSet = true
        }
        
        //dateLabel.text = dateValue
        nextSetWorkout.text = "\(dateValue)"
        
        if(nextWorkout.date <= Date()) {
            nextSetWorkout.text = "No Workout Set!"
            //isSet = false
        }
        print("Set the label")
    }
    
}

