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
    var action: () -> Void
    
    var body: some View {
        Picker(title, selection: $selectedOption){
            ForEach(list, id: \.self) { item in
                Text(item)
                    .font(.custom("Lato", size: FontSize.text.rawValue))
            }
        }
        .tint(Color("LightBlue"))
        .task {
            action()
        }
        .pickerStyle(DefaultPickerStyle())
        .frame(width: 325, height: 60)
        .background(Color("BackgroundColor"))
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color("LightBlue"), lineWidth: 4)
        )
        .cornerRadius(25)
        
        
    }
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

