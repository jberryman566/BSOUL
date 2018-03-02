//
//  AppDelegate.swift
//  BSOUL
//
//  Created by  Joshua W Berryman on 2018-02-23.
//  Copyright © 2018  Joshua W Berryman. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //let notification = launchOptions![UIApplicationLaunchOptionsKey.remoteNotification]
        
        //if (application.applicationState == UIApplicationState.active) {
         //   loadWorkout()
        //}
        return true
    }

    
    func loadWorkout() {
        
        print("Called app delegate.loadWorkout")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let appVC = storyBoard.instantiateViewController(withIdentifier: "WorkoutViewController")
        let navigationController = UINavigationController.init(rootViewController: appVC)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        
    }
    /*
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
 */
    /*
    private func application(_ application: UIApplication, didRecieveLocalNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult)) {
        
        if (application.applicationState == UIApplicationState.inactive) {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let appVC = storyBoard.instantiateViewController(withIdentifier: "WorkoutViewController")
            let navigationController = UINavigationController.init(rootViewController: appVC)
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
        
    }
    */

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        //loadWorkout()
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

