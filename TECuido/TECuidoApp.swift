//
//  TECuidoApp.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

@main
struct TECuidoApp: App {
    
    @StateObject var predictionStatus = PredictionStatus()
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    @State private var isNavigatingToEmergenciasView = false

    
    var body: some Scene {
        WindowGroup {
            
            NavigationStack {
                
                TECuidoView()
                
            }
            .environmentObject(predictionStatus)
            .environmentObject(appDelegate.notificationViewModel)
            .background(
                NavigationLink("", destination: EmergenciasView(selection: 2, hayEmergencia: true, emergencia: appDelegate.notificationViewModel.emergencia), isActive: $isNavigatingToEmergenciasView)
            )
            .onReceive(appDelegate.notificationViewModel.$notificationToken){token in
                Task {
                    await appDelegate.notificationViewModel.sendNotificationToken()
                }
            }
            .onReceive(appDelegate.notificationViewModel.$navigateToNotificationView) { navigate in
                if navigate {
                    isNavigatingToEmergenciasView = true
                }
            }
            
        }
    }
}


