//
//  NotificationsUtils.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//

import Foundation
import UserNotifications
import UIKit

func registerForNotifications() async {
    
    let notificationCenter = UNUserNotificationCenter.current()
    let authorizationOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
    
    do {
        let authorizationGranted = try await notificationCenter.requestAuthorization(options: authorizationOptions)
    
        if authorizationGranted {
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
            print("Notificaciones remotas autorizadas por el usuario")
        } else {
            print("Error al solicitar el prermiso para notificaciones remotas")
        }
    } catch {
        print("Error al solicitar el prermiso para notificaciones remotas. Error \(error.localizedDescription)")
    }
    
}


