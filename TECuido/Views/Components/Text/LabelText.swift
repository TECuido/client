//
//  Label.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Lato", size: FontSize.label.rawValue))
            .frame(width:340)
            .bold()
            .multilineTextAlignment(.center)
            .foregroundColor(Color("LightBlue"))
    }
}

struct Label_Previews: PreviewProvider {
    static var previews: some View {
        LabelText(text: "Lavel")
    }
}
