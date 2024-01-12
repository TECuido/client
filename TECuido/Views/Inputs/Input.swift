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
    var inputError: Int
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 30, height: 20)
                .padding(.leading, 15)
            TextField("",
                      text: $inputText,
                      prompt: Text(inputPrompt)
                      .foregroundColor(Color("PlaceholderColor"))
                )
            .font(.custom("Lato", size: 25))
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
        Input(inputText: .constant("Input"), inputPrompt: "type your input", icon: "envelope.fill", inputError: 0)
    }
}

