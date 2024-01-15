//
//  IconCircle.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct IconCircle: View {
    
    var icon: String
    var color: Color
    
    var body: some View {
        ZStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(color)
        }
    }
}
