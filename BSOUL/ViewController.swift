//
//  ViewController.swift
//  BSOUL
//
//  Created by  Joshua W Berryman on 2018-02-23.
//  Copyright © 2018  Joshua W Berryman. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
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
    @IBOutlet weak var bsoulLevel: UILabel!
    @IBOutlet weak var bsoulProgress: UIProgressView!
    //var isSet: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assignbackground()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "test2")!)
        //self.view.backgroundColor = UIColor(imagePattern: UIImage(named: "fitness"))
    
        //if(nextWorkout.date <= Date()) {
            //nextSetWorkout.text = "No Workout Set!"
            //isSet = false
        //}
        
        if (nextSetWorkout.text == "NULL") {
            nextSetWorkout.text = "No Workout Set!"
        }
        // Do any additional setup after loading the view, typically from a nib.
 
        configureUserNotificationCenter()
        // set this up so user selects image from their library (ie. profile picture)
        //mainImage.image = UIImage(named: "fitness")
        //print(Date())
        
    }
    
    func assignbackground(){
        let background = UIImage(named: "fitness")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    private func configureUserNotificationCenter() {
        UNUserNotificationCenter.current().delegate = self
        
        let actionReadLater = UNNotificationAction(identifier: Notification.Action.readLater, title: "Get My Pump Up On!", options: UNNotificationActionOptions.foreground)
        
        let tutorialCategory = UNNotificationCategory(identifier: Notification.Category.tutorial, actions: [actionReadLater], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([tutorialCategory])
        
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
 
        if (response.actionIdentifier == "readLater") {
            print("You are correct, we selected the button")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.loadWorkout()
        } else {
            nextSetWorkout.text = "You Missed Your Workout!"
        }
        completionHandler()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setWorkout() {
        
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let selectedDate = nextWorkout.date
        dateHasBeenSet(at: selectedDate)
        //appDelegate.scheduleNotification(at: selectedDate)
        scheduleNotification(at: selectedDate)
        //we need to call this when notification clicked
        //appDelegate.loadWorkout()
        
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
        //content.body = "Just wanted to say Brian sucks and Josh is better"
        content.categoryIdentifier = Notification.Category.tutorial
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
    /*
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case Notification.Action.readLater:
            print("Save Tutorial For Later")
        default:
            print("Other Action")
        }
        
        completionHandler()
    }
 */
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

