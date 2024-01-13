//
//  Input.swift
//  TECuido
//
//  Created by Alumno on 11/01/24.
//

import SwiftUI

struct Input: View {
    
    @Binding var inputText: String
    var inputPrompt: String
    var icon: String
    var iconSize: (CGFloat, CGFloat)
    var iconPadding: CGFloat
    var inputError: Int = 0
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: iconSize.0, height: iconSize.1)
                .padding(.leading, iconPadding)
            TextField("",
                      text: $inputText,
                      prompt: Text(inputPrompt)
                      .foregroundColor(Color("PlaceholderColor"))
                )
            .font(.custom("Lato", size: 24))
                .padding(.leading, 5)
                .autocapitalization(.none)
        }
        .frame(width: 325, height: 64)
        .background(Color("InputBackground"))
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.red, lineWidth: CGFloat(inputError)*2)
        }
        .padding([.top, .bottom], 10)
    }
}

struct
Input_Previews: PreviewProvider {
    static var previews: some View {
        Input(inputText: .constant("Input"), inputPrompt: "type your input", icon: "envelope.fill", iconSize: (20, 20), iconPadding:15, inputError: 0)
    }
}

