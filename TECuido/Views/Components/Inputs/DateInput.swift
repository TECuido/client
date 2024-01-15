//
//  DateInput.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct DateInput: View {
    
    @Binding var date: Date
    var inputPrompt: String
    var inputError: Int = 0
    
    var body: some View {
        
        //Input fecha
        HStack {
            Image(systemName: "calendar")
                .resizable()
                .frame(width: 25, height: 20)
                .foregroundColor(Color("LightBlue"))
                .padding(.leading, 15)
            
            DatePicker(selection: $date,
                       in: ...Date(),
                       displayedComponents: .date) {
                Text("Fecha")
                    .foregroundColor(Color("PlaceholderColor"))
            }
           .font(.custom("Lato", size: 24))
            .padding(.leading, 5)
            .autocapitalization(.none)
        }
        .frame(width: 325, height: 60)
        .background(Color("InputBackground"))
        .cornerRadius(20)
        .padding([.top, .bottom], 10)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("Red"), lineWidth: CGFloat(inputError)*2)
        }
                
    }
}

struct
DateInput_Previews: PreviewProvider {
    static var previews: some View {
        DateInput(date: .constant(Date()), inputPrompt: "type your input", inputError: 0)
    }
}

