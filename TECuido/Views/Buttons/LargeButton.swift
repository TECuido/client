//
//  LargeButton.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//

import SwiftUI

struct LargeButton: View {
    
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
                        .font(.custom("Lato", size: 28))
                        .bold()
                }
                .frame(width: 360, height: 170)
                .background(Color("Red"))
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

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButton(
            title: "Button",
            iconName: "envelope.fill",
            hint: "Button"
        ){}
    }
}
