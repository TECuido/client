//
//  BigText.swift
//  TECuido
//
//  Created by Alumno on 15/01/24.
//

import SwiftUI

struct BigText: View {
    
    var text:String
    
    var body: some View {
        Text(text)
            .font(.custom("Lato", size: FontSize.bigText.rawValue))
            .frame(width:340)
            .padding(.bottom, 10)
            .bold()
            .foregroundColor(Color("TextColor"))
            .multilineTextAlignment(.center)
    }
}

struct BigText_Previews: PreviewProvider {
    static var previews: some View {
        BigText(text: "Title")
    }
}
