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
    var notificationsManager = NotificationsManager()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Check if launched from notification
        let notificationOption = launchOptions?[.remoteNotification]

        // get notification
        if
          let notification = notificationOption as? [String: AnyObject],
          let aps = notification["aps"] as? [String: AnyObject] {
          
            // handle notification
            notificationsManager.handleNotificationReceived()
          
        }

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
        notificationsManager.handleNotificationReceived()

        completionHandler(.newData)
    }
}
