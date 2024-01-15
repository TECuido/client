//
//  OptionsAlert.swift
//  TECuido
//
//  Created by Alumno on 13/01/24.
//

import SwiftUI

func OptionsAlert(
    title: String,
    message: String,
    primaryText: String = "Aceptar",
    action: @escaping () -> Void) -> Alert {
    
    return Alert(
        title: Text(title),
        message: Text(message),
        primaryButton: .default(
            Text(primaryText),
            action: action
        ),
        secondaryButton: .cancel(
            Text("Cancelar")
        )
    )
}

