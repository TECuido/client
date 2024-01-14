//
//  NoUserIcon.swift
//  TECuido
//
//  Created by Alumno on 13/01/24.
//

import SwiftUI

struct NoUserIcon: View {
    var body: some View {
        Image(systemName: "person.crop.circle.fill.badge.xmark")
            .resizable()
            .frame(width: 180,height: 150)
            .foregroundColor(Color("Red"))
            .padding(20)
    }
}


struct NoUserIcon_Previews: PreviewProvider {
    static var previews: some View {
        NoUserIcon()
    }
}
