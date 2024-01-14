//
//  NumberedItem.swift
//  TECuido
//
//  Created by Alumno on 13/01/24.
//

import SwiftUI

//Numbered list Item
//El uso intencionado de este componente es incluirlo dentro de un HStack con botones u otros elementos que sean necesarios
struct NumberedItem: View {
    var number: Int
    var title: String
    var subtitle: String = ""
    
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("LightBlue"))
                .frame(width: 35, height: 35)
            Text("\(number)")
                .foregroundColor(Color("White"))
                .font(.custom("Lato", size:FontSize.text.rawValue))
        }
        
        VStack(alignment: .leading) {
            Text(title)
                .font(.custom("Lato", size:FontSize.text.rawValue))
                .bold()
            Text(subtitle)
                .font(.custom("Lato", size:FontSize.text.rawValue))
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        .padding(.leading, 10)
    }
}


