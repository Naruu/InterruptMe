//
//  AppDelegate.swift
//  InterruptMe
//
//  Created by Release on 03/05/2019.
//  Copyright © 2019 Hyelee Lee. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = MainController()
        
        if #available(iOS 11.0, *){
            let notiCenter = UNUserNotificationCenter.current()
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) {(didAllow,e) in }
        
        }
            else {
            let setting = UIUserNotificationSettings(types:[.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(setting)
        }
        
        DispatchQueue.main.async {
            application.registerForRemoteNotifications()
        }
            return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let token = deviceToken.map{ String(format: "%02.2hhx", $0)}.joined()
        print(token)
        //self.sendDevicdTokenToServer(data: deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        // Thorw error message
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


    /*
    private func sendNotification(){
        
        let ud = UserDefaults.standard
        
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { settings in
            
            if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                let nContent = UNMutableNotificationContent()
                nContent.title = "Push"
                nContent.subtitle = "subtitle"
                nContent.body = "body"
                
                var i = 1
                if let interval = ud.string(forKey: "interval"){
                    //notiCounter = Int(interval)! * 60
                    //For testing
                    i = Int(interval)!
                }
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval:Double(i), repeats :true)
                let request = UNNotificationRequest(identifier:"interrupt", content: nContent, trigger:trigger)
                
                UNUserNotificationCenter.current().add(request)
                
                print("notification set! It will interrupt you in \(i)seconds")
            } else {
                print("User did not allowed")
            }
        
            guard settings.authorizationStatus == .authorized else { return }
            
        })
        

    }
     */

}

