//
//  PrimaryButton.swift
//  TECuido
//
//  Created by Alumno on 11/01/24.
//

import SwiftUI

struct PrimaryButton: View {
    
    var title: String
    var action: () -> Void

    // Boton Iniciar Sesion
    var body: some View {
        Button(title){
            action()
        }
        .accessibilityLabel(title)
        .foregroundColor(Color("White"))
        .frame(width: 320, height:64)
        .background(Color("LightBlue"))
        .clipShape(Capsule())
        .shadow(color: Color("ShadowColor").opacity(0.25), radius: 5, x: 0, y: 5)
        .padding(.top, 30)
        .font(.custom("Lato", size: FontSize.buttonText.rawValue))
        .bold()
    }

}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Button", action: {} )
    }
}

