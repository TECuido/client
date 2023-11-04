//
//  TECuidoApp.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

@main
struct TECuidoApp: App {
    
    @StateObject private var predictionStatus = PredictionStatus()
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    
    var body: some Scene {
        WindowGroup {
            TECuidoView()
                .environmentObject(predictionStatus)
        }
    }
}


