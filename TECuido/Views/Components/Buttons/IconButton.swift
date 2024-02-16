//
//  IconButton.swift
//  TECuido
//
//  Created by Alumno on 15/01/24.
//

import SwiftUI

struct IconButton: View {
    
    var title: String
    var iconName: String
    var hint: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            
            VStack {
                
                VStack {
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                }
                .frame(width: 100, height: 80)
                .background(
                    isSelected ? Color.red : Color("LightBlue")
                )
                .cornerRadius(16)
                .padding(2)
                .foregroundColor(Color("White"))
                .accessibilityHint(hint)
                .accessibilityLabel(title)
                
                Text(title)
                    .foregroundColor(Color("TextColor"))
                    .font(.custom("Lato", size: FontSize.text.rawValue))
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 3)
                    .frame(width: 115)
                
            }
            
        }
        
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(
            title: "Button",
            iconName: "heart.circle.fill",
            hint: "hint",
            isSelected: false
        ){}
    }
}
