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
    @State var emergencia: DataEmergenciaGrupoModel = DataEmergenciaGrupoModel.defaultEmergencia
    
    var body: some Scene {
        WindowGroup {
            
            NavigationStack {
                
                TECuidoView()
                .background(
                    NavigationLink("", destination: EmergenciasView(selection: 2, hayEmergencia: true), isActive: $isNavigatingToEmergenciasView)
                )
                
            }
            .environmentObject(predictionStatus)
            .environmentObject(appDelegate.notificationViewModel)
            .onReceive(appDelegate.notificationViewModel.$notificationToken){token in
                Task {
                    await appDelegate.notificationViewModel.sendNotificationToken()
                }
            }
            .onReceive(appDelegate.notificationViewModel.$emergencia) { em in
                if em.idEmergencia > -1 {
                    emergencia = em
                    isNavigatingToEmergenciasView = true
                }
            }
            
        }
    }
}


