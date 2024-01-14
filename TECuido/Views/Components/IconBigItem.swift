//
//  IconBigItem.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct IconBigItem: View {
    
    var iconName: String
    var title: String
    var text1: String
    var text2: String = ""
        
    var body: some View {
        
        IconCircle(icon: iconName)

        VStack(alignment: .leading){
            Text(title)
                .font(.custom("Lato", size:FontSize.text.rawValue))
                .bold()
            Text(text1)
                .font(.custom("Lato", size:FontSize.text.rawValue))
            Text(text2)
                .font(.custom("Lato", size:FontSize.text.rawValue))
        }.padding(15)
        
    }
}
