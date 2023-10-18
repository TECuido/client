//
//  EstatusEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI

struct EstatusEmergenciaView: View {
    
 
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            VStack{
                // Texto
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
                Text("Descripción de la alerta")
                    .font(.title3)
                    .bold()
                VStack{
                   // Aqui iria la descripcion ya enviada
                    Text("Descripción de la alerta")
                    Spacer()
                        .font(.title2)
                }.frame(width: 300, height: 200)
            
                
                Rectangle()
                    .foregroundColor((Color(red: 0.8392,green: 0,blue: 0)))
                    .ignoresSafeArea()
            }
        }
    }
}

struct EstatusEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        EstatusEmergenciaView()
    }
}
