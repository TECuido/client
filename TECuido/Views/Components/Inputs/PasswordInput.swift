//
//  PasswordInput.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//

import SwiftUI

struct PasswordInput: View {
    
    @Binding var inputText: String
    var inputPrompt: String
    var inputError: Int = 0
    
    var body: some View {
        HStack {
            Image(systemName: "lock.fill")
                .resizable()
                .frame(width: 17, height: 25)
                .padding(.leading, 25)
            SecureField("",
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

struct PasswordInput_Previews: PreviewProvider {
    static var previews: some View {
        PasswordInput(inputText: .constant("Input"), inputPrompt: "type your input", inputError: 0)
    }
}
