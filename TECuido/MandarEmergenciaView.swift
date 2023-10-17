//
//  MandarEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI

struct MandarEmergenciaView: View {
    @State private var showContactosView = false
    var body: some View {
        ZStack{
                VStack{
                    
                    Text("Emergencias")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                    // Imagen principal
                    Image("bien")
                    // Texto de todo bien
                    Text("Manda una emergencia")
                        .font(.title)
                        .bold()
                    Text("a uno de tus contactos")
                        .font(.title)
                        .bold()
                    // Agregar select de motivo de alerta
                    VStack{
                        
                        Text("Descripción de la alerta")
                        Spacer()
                            .font(.title2)
                    }.frame(width: 300, height: 150)
                        Button("Continuar") {
                                        showContactosView = true
                                    }
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(width: 300, height: 65)
                                    .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                    .cornerRadius(25)
                                    .padding(30)
                                    .font(.title)

                    Rectangle()
                        .foregroundColor((Color(red: 0.1294,green: 0.5882,blue: 0.9529)))
                        .ignoresSafeArea()
                    
                    
                }
                .background(
                            NavigationLink("", destination: ContactosEmergenciaView(), isActive: $showContactosView)
                        )

                
            }
    }
}

struct MandarEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        MandarEmergenciaView()
    }
}
