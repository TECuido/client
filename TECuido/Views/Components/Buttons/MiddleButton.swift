//
//  MiddleButton.swift
//  TECuido
//
//  Created by Alumno on 15/01/24.
//

import SwiftUI

struct MiddleButton: View {
    
    var title: String
    var iconName: String
    var hint: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Text(title)
                    .foregroundColor(Color("White"))
                    .font(.custom("Lato", size: FontSize.text.rawValue))
                    .bold()
                    .padding(.bottom, 3)
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
            }
            .frame(width: 145, height: 100)
            .background(
                isSelected ? Color("DarkBlue") : Color("LightBlue")
            )
            .cornerRadius(16)
            .padding(2)
            .foregroundColor(Color("White"))
            .accessibilityHint(hint)
            .accessibilityLabel(title)
        }
        
    }
}

struct MiddleButton_Previews: PreviewProvider {
    static var previews: some View {
        MiddleButton(
            title: "Button",
            iconName: "heart.circle.fill",
            hint: "hint",
            isSelected: false
        ){}
    }
}
