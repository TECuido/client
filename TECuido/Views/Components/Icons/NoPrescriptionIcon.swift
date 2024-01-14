//
//  NoPrescriptionIcon.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct NoPrescriptionIcon: View {
    var body: some View {
        Image(systemName: "heart.text.square.fill")
            .resizable()
            .frame(width: 150,height: 150)
            .foregroundColor(Color("Red"))
            .padding(20)
    }
}


struct NoPrescriptionIcon_Previews: PreviewProvider {
    static var previews: some View {
        NoPrescriptionIcon()
    }
}
