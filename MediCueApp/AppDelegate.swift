//
//  AppDelegate.swift
//  MediCueApp
//
//  Created by Mads Østergaard on 07/06/2018.
//  Copyright © 2018 Mads Østergaard. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ESTTriggerManagerDelegate  {

    var window: UIWindow?
    
    let triggerManager = ESTTriggerManager()

    let commands = ["MorningTime","FormiddagTime","MiddagTime",
                    "EftermiddagTime","AftenTime","NatTime"]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        self.triggerManager.delegate = self
        
        let rule1 = ESTOrientationRule.orientationEquals(
            .horizontalUpsideDown, forNearableIdentifier: "7946c1b3ad6b2184")
        let rule2 = ESTMotionRule.motionStateEquals(
            true, forNearableIdentifier: "7946c1b3ad6b2184")
        let trigger = ESTTrigger(rules: [rule1, rule2], identifier: "tom the trigger")
        
        self.triggerManager.startMonitoring(for: trigger)
        
        
        return true
    }
    
    func triggerManager(_ manager: ESTTriggerManager,
                        triggerChangedState trigger: ESTTrigger) {
        if (trigger.identifier == "tom the trigger" && trigger.state == true) {
            print("Hello, digital world! The physical world has spoken.")
        } else {
            print("Goodnight. <spoken in the voice of a turret from Portal>")
        }
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
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

