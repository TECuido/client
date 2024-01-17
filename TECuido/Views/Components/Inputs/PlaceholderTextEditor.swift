//
//  PlaceholderTextEditor.swift
//  TECuido
//
//  Created by Alumno on 15/01/24.
//

import SwiftUI

struct PlaceholderTextEditor: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .scrollContentBackground(.hidden)
                .padding(.top, 10)
                .padding([.bottom, .leading, .trailing], 15)
                .lineSpacing(0.8)
            if text.isEmpty {
                Text(placeholder)
                    .opacity(0.75)
                    .padding(15)
                    .foregroundColor(Color("PlaceholderColor"))
                
            }
        }
        .foregroundColor(Color("PlaceholderColor"))
        .font(.custom("Lato", size: FontSize.text.rawValue))
        .frame(width: 325, height: 100)
        .background(Color("InputBackground"))
        .cornerRadius(20)

    }
}

struct
PlaceholderTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderTextEditor(
            text: .constant("Input"),
            placeholder: "Ingresa un texto"
        )
    }
}

