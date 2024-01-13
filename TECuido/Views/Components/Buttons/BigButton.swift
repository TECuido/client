//
//  BigButton.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//

import SwiftUI

struct BigButton: View {
    
    var title: String
    var iconName: String
    var hint: String
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action){
            ZStack {
                VStack {
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                    Text(title)
                        .foregroundColor(.white)
                        .font(.custom("Lato", size: FontSize.largeButtonText.rawValue))
                        .bold()
                        .frame(width: 150)
                }
                .frame(width: 170, height: 170)
                .background(Color("LightBlue"))
                .cornerRadius(30)
                .padding(5)
                .foregroundColor(Color("White"))
                .font(.title)
                .accessibilityLabel(title)
                .accessibilityHint(hint)
            }
        }
            
    }
}

struct BigButton_Previews: PreviewProvider {
    static var previews: some View {
        BigButton(
            title: "Button",
            iconName: "envelope.fill",
            hint: "Button"
        ){}
    }
}
