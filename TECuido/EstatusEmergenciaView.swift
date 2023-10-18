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
                ScrollView{
                   // Aqui iria la descripcion ya enviada
                    Text("Descripción de la alerta")
                    Spacer()
                        .font(.title2)
                }.frame(width: 300, height: 100)
            
                Button("Finalizar") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
                .bold()
                .frame(width: 300, height: 65)
                .background(Color(red: 0.8392,green: 0,blue: 0))
                .cornerRadius(30)
                .padding(   10)
                .font(.title)
                Rectangle()
                    .foregroundColor((Color(red: 0.8392,green: 0,blue: 0)))
                    .ignoresSafeArea()
            } /*.background(
                NavigationLink("", destination: HomeView(), isActive: $showHomeView)
            )*/
        }
    }
}

struct EstatusEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        EstatusEmergenciaView()
    }
}
