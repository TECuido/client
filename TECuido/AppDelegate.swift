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
    
    @StateObject var notificationViewModel = NotificationViewModel()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) async {
        let tokenString = deviceToken.reduce("", {$0 + String(format: "%02x", $1)})
        notificationViewModel.notificationToken = tokenString
        await notificationViewModel.sendNotificationToken()
        print("Token de notificaciones remotas - \(tokenString)")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Fallo al registrarse para notificaciones remotas. Error \(error)")
    }
}
