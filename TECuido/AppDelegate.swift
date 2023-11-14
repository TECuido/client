//
//  AppDelegate.swift
//  TECuido
//
//  Created by Alumno on 03/11/23.
//

import Foundation
import UIKit
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var notificationViewModel = NotificationViewModel()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge, .carPlay], completionHandler: { (granted, error) in
                if granted {
                    print("granted")
                }else{
                    print("not granted")
                }
            })

        UNUserNotificationCenter.current().delegate = self
                
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenString = deviceToken.reduce("", {$0 + String(format: "%02x", $1)})
        print("Token de notificaciones remotas - \(tokenString)")
        
        notificationViewModel.notificationToken = tokenString

    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Fallo al registrarse para notificaciones remotas. Error \(error)")
    }
    
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
                
        guard let aps = userInfo["aps"] as? [String: AnyObject] else {
            completionHandler(.failed)
            return
        }
        
        // Trigger the navigation via the environment object
        self.notificationViewModel.setEmergencia(notification: userInfo)
        
        completionHandler(.newData)
        
    }
    
    
}


extension AppDelegate: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo

        if let aps = userInfo["aps"] as? [String: AnyObject] {
            // Do what you want with the notification
            self.notificationViewModel.setEmergencia(notification: userInfo)
        }

      completionHandler()
    }
}
