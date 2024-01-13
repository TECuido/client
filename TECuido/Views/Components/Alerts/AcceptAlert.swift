//
//  AcceptAlert.swift
//  TECuido
//
//  Created by Alumno on 13/01/24.
//

import Foundation
import SwiftUI

func AcceptAlert(
    title: String,
    message: String,
    action: @escaping () -> Void) -> Alert {
    
    return Alert(
        title:
            Text(title),
        message: Text(message),
        dismissButton: .default(
            Text("OK"),
            action: action
        )
    )
}
