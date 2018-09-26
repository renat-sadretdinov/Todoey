//
//  AppDelegate.swift
//  Todoey
//
//  Created by Renat Sadretdinov on 23/09/2018.
//  Copyright © 2018 Renat Sadretdinov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // this method is called first while the app is being launched
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // get path to the application inside the device
        
        //print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
        /*
         ["/Users/renatsadretdinov/Library/Developer/CoreSimulator/Devices/2D3ADDF4-934F-483F-BB2A-2363B8B71A18/data/Containers/Data/Application/25F2368A-11AA-48CD-AD3F-8B3B8B5A02BB/Documents"]
         The second key is this particular app's sandbox. The remaining path of "Documents" is not we want to find so after the second key we pressed "Library" than "Preferences" in order to get the plist
         */
        return true
    }

    // this method is called when something wrong is happen with the phone (for ex. user receive a call)
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    // this method called when the app disappears from the screen
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

    // this method can be user triggerred or it can be system triggerred
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

