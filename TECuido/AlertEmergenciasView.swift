//
//  EmergenciasView.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct AlertEmergenciasView: View {
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
                    .foregroundColor(Color(red: 0.8392,green: 0,blue: 0))
                    .font(.system(size: 55))
                    .bold()
                // Imagen principal
                Image("Mal")
                // Texto de todo bien
                Text("Alerta")
                    .font(.largeTitle)
                    .bold()
                ScrollView{
                   
                    Text("Descripción de la alerta")
                    Spacer()
                        .font(.title2)
                }.frame(width: 300, height: 100)
                Text("Enviado por:")
                    .font(.title2)
                Text("Familiar")
                    .font(.title2)
                
               
                Rectangle()
                    .foregroundColor((Color(red: 0.8392,green: 0,blue: 0)))
                    .ignoresSafeArea()
            }
                
            
        }
    }
}

struct AlertEmergenciasView_Previews: PreviewProvider {
    static var previews: some View {
        AlertEmergenciasView()
    }
}