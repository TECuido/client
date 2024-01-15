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
        NumberCircle(number: number)
        
        VStack(alignment: .leading) {
            Text(title)
                .font(.custom("Lato", size:FontSize.text.rawValue))
                .bold()
                .padding(.bottom, 1)
            Text(subtitle)
                .font(.custom("Lato", size:FontSize.text.rawValue))
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        .padding(.leading, 10)
    }
}


