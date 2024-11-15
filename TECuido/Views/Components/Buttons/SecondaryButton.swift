//
//  SecondaryButton.swift
//  TECuido
//
//  Created by Alumno on 11/01/24.
//

import SwiftUI

struct SecondaryButton: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(title){
            action()
        }
        .accessibilityLabel(title)
        .foregroundColor(Color("PrimaryColor"))
        .frame(width: 320, height:64)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color("PrimaryColor"), lineWidth: 2)
                .shadow(color: Color("ShadowColor").opacity(0.25), radius: 5, x: 0, y: 5)
        )
        .padding(.top, 30)
        .font(.custom("Lato", size: FontSize.buttonText.rawValue))
        .bold()
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(title: "Button", action: {} )
    }
}
