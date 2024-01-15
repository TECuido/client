//
//  NumberedBigItem.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct NumberedBigItem: View {
    
    var number: Int
    var title: String
    var text1: String
    var text2: String = ""
    
    var body: some View {
        NumberCircle(number: number)
        
        VStack(alignment: .leading){
            Text(title)
                .font(.custom("Lato", size:FontSize.text.rawValue))
                .bold()
                .padding(.bottom, 1)
            Text(text1)
                .font(.custom("Lato", size:FontSize.text.rawValue))
                .padding(.bottom, 1)
            Text(text2)
                .font(.custom("Lato", size:FontSize.text.rawValue))
        }.padding(15)
    }
}

