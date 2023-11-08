//
//  EmergenciasView.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct AlertEmergenciasView: View {
    
    @State var dataEmergencia: DataEmergenciaGrupoModel
    @State private var rotation: Double = 0.0
    
    
    var body: some View {
        ZStack{
            VStack{
                // Titulo
                Text("Emergencias")
                    .foregroundColor(Color(red: 0.8392,green: 0,blue: 0))
                    .font(.system(size: 55))
                    .bold()
                // Imagen principal
                Image("Mal")
                    .padding()
                    .rotationEffect(.degrees(rotation))
                    .onAppear {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(200)){
                            withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                rotation = 30
                            }
                        }
                    }
                
                
                // Texto de alerta
                if((dataEmergencia.descripcion) != nil){
                    
                    Text("Descripción de la alerta:")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 10)
                    
                    Text(dataEmergencia.descripcion!)
                        .font(.title3)
                } else {
                    Text("No se agregó descripción")
                }
            
            
                if(dataEmergencia.emisor != nil){
                    Text("Enviado por:")
                        .font(.title2)
                        .bold()
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    Text(dataEmergencia.emisor!)
                        .font(.title3)
                }
                
                
            }
                
            
        }
    }
}

struct AlertEmergenciasView_Previews: PreviewProvider {
    static var previews: some View {
        AlertEmergenciasView(dataEmergencia: DataEmergenciaGrupoModel.defaultEmergencia)
    }
}
