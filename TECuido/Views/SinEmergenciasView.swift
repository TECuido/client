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
            VStack{
                // icono de la pantalla
                /*Image("icon")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .position(x:60,y:20)
                Spacer()*/
                // Titulo
                Text("Emergencias")
                    .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .font(.system(size: 55))
                    .bold()
                // Imagen principal
                Image("bien")
                // Texto de todo bien
                VStack{
                    Text("Todo se")
                        .font(.system(size:45))
                        .bold()
                    Text("encuentra")
                        .font(.system(size:45))
                        .bold()
                    Text("bien")
                        .font(.system(size:45))
                        .bold()
                }.frame(height: 200)
                
               
                Rectangle()
                    .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .ignoresSafeArea()
                   
                
            }
            
                
            
        }
    }
}

struct SinEmergenciasView_Previews: PreviewProvider {
    static var previews: some View {
        SinEmergenciasView()
    }
}
