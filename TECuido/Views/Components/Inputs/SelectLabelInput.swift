//
//  SelectLabelInput.swift
//  TECuido
//
//  Created by Alumno on 15/01/24.
//

import SwiftUI

struct SelectLabelInput: View {
    
    var title: String
    @Binding var selectedOption: String
    var list: [String]
    var iconMap: [String: String]
    var action: () -> Void
    
    var body: some View {
        Picker(title, selection: $selectedOption){
            ForEach(list, id: \.self) { item in
                HStack {
                    
                    Image(systemName: iconMap[item] ?? "questionmark.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(80)
                                        
                    Text(item)
                        .font(.custom("Lato", size: FontSize.text.rawValue))
                        .padding(.leading, 20)
                }
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
SelectLabelInput_Previews: PreviewProvider {
    static var previews: some View {
        SelectLabelInput(
            title: "Picker",
            selectedOption: .constant("1"),
            list: ["1", "2", "3"],
            iconMap: [
                "1": "heart.circle.fill",
                "2": "heart.circle.fill",
                "3": "heart.circle.fill"
            ]
        ){}
    }
}

