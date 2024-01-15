//
//  SinEmergenciasView.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct SinEmergenciasView: View {

    var body: some View {
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{
                Title(text: "No hay emergencias")
                Image(systemName: "face.smiling.inverse")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("LightBlue"))
                    .padding()
                SubTitle(text: "Todo se encuentra bien")
            }
            
        }
    }
}

struct SinEmergenciasView_Previews: PreviewProvider {
    static var previews: some View {
        SinEmergenciasView()
    }
}
