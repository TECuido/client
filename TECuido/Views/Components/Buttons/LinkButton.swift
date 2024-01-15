//
//  LinkButton.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct LinkButton: View {
    
    var title: String
    var link: String
    
    var body: some View {
        
        Link(title, destination: URL(string: link)!)
            .accessibilityLabel(title)
            .foregroundColor(Color("White"))
            .frame(width: 320, height:64)
            .background(Color("LightBlue"))
            .clipShape(Capsule())
            .shadow(color: Color("ShadowColor").opacity(0.25), radius: 5, x: 0, y: 5)
            .padding(.top, 30)
            .font(.custom("Lato", size: FontSize.buttonText.rawValue))
            .bold()
        
    }
}
