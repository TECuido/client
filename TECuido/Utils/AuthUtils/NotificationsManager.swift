//
//  NotificationsManager.swift
//  TECuido
//
//  Created by Alumno on 07/11/23.
//

import Foundation
import SwiftUI

class NotificationsManager: ObservableObject {
    @Published var navigateToNotificationView = false
    @Published var emergencia = DataEmergenciaGrupoModel.defaultEmergencia

    func handleNotificationReceived() {
        navigateToNotificationView = true
        print("llego notificacion")
    }
}
