//
//  TECuidoApp.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI
enum{
    case homes
    case mandarEmergencia
    case contactosEmergencia
}
@main
struct TECuidoApp: App {
    var body: some Scene {
        WindowGroup {
            TECuidoView()
        }
    }
}
