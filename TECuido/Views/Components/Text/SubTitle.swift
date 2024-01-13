//
//  SubTitle.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//

import SwiftUI

struct SubTitle: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Inter", size: FontSize.subtitle.rawValue))
            .bold()
            .frame(width: 280)
            .padding()
            .multilineTextAlignment(.center)
    }
}

struct Subtitle_Previews: PreviewProvider {
    static var previews: some View {
        SubTitle(text: "Subtitle")
    }
}
