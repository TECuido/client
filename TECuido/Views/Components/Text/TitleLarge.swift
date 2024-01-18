//
//  TitleLarge.swift
//  TECuido
//
//  Created by Alumno on 16/01/24.
//

import SwiftUI

struct TitleLarge: View {
        var text: String
        var color: Color = Color("TitleColor")
        
        var body: some View {
            Text(text)
                .foregroundColor(color)
                .font(.custom("Inter", size: FontSize.title.rawValue))
                .bold()
                .padding(10)
                .multilineTextAlignment(.center)
                .frame(width: 340, height: 180)
            
        }
    }


struct TitleLarge_Previews: PreviewProvider {
    static var previews: some View {
        TitleLarge(text: "Title")
    }
}
