//
//  NumberCircle.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct NumberCircle: View {
    var number: Int
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("LightBlue"))
                .frame(width: 35, height: 35)
            Text("\(number)")
                .foregroundColor(Color("White"))
                .font(.custom("Lato", size:FontSize.text.rawValue))
        }
    }
}
