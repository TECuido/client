//
//  SelectInput.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct SelectInput: View {
    
    var title: String
    @Binding var selectedOption: String
    var list: [String]
    var inputError: Int = 0
    var action: () -> Void
    
    var body: some View {
        Picker(title, selection: $selectedOption){
            ForEach(list, id: \.self) { item in
                Text(item)
                    .font(.custom("Lato", size: FontSize.text.rawValue))
            }
        }
        .tint(Color("PlaceholderColor"))
        .task {
            action()
        }
        .pickerStyle(DefaultPickerStyle())
        .frame(width: 325, height: 60)
        .background(Color("InputBackground"))
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color("Red"), lineWidth: CGFloat(inputError)*2)
        )
        .cornerRadius(25)    }
}

struct
SelectInput_Previews: PreviewProvider {
    static var previews: some View {
        SelectInput(
            title: "Picker",
            selectedOption: .constant("1"),
            list: ["1", "2", "3"]
        ){}
    }
}

