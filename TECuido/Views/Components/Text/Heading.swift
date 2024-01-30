//
//  Heading.swift
//  TECuido
//
//  Created by Alumno on 15/01/24.
//

import SwiftUI

struct Heading: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Lato", size: FontSize.label.rawValue))
            .bold()
            .foregroundColor(Color("HeadingColor"))
            .padding(.bottom, 8)
    }
}

struct Heading_Previews: PreviewProvider {
    static var previews: some View {
        Heading(text: "Heading")
    }
}
