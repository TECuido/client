//
//  LesionesView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI

struct LesionesView: View {
    var body: some View {
        VStack{
            Text("Sigue en producción")
                .font(.largeTitle)
                .bold()
            Image(systemName: "bandage.fill")
                .resizable()
                .frame(width: 80,height: 80)
        }
    }
}

struct LesionesView_Previews: PreviewProvider {
    static var previews: some View {
        LesionesView()
    }
}
