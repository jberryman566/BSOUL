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

        //Get notification Permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in print("granted: (\(granted)")}
        
        //defaults for saving game data
        let defaults = UserDefaults.standard
        let defaultValue = ["XP" : 0, "Level" : 1, "XPneeded" : 100, "oldCap" : 0]
        defaults.register(defaults: defaultValue)
        
        return true
    }

    // Sets up our workout view
    func loadWorkout() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let appVC = storyBoard.instantiateViewController(withIdentifier: "WorkoutViewController")
        let navigationController = UINavigationController.init(rootViewController: appVC)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }

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
