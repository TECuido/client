//
//  Title.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//

import SwiftUI

struct Title: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TitleColor"))
            .font(.custom("Inter", size: FontSize.title.rawValue))
            .bold()
            .padding(10)
            .multilineTextAlignment(.center)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(text: "Title")
    }
}

