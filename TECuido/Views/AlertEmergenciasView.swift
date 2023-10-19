//
//  EmergenciasView.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct AlertEmergenciasView: View {
    
    @State var angle = 0.0
    @State var movingLeft = true
    
    
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
                    .rotationEffect(.degrees(angle))
                    
                    .animation(Animation.easeInOut(duration: 0.3).repeatForever(), value: angle)
                    .onAppear {
                        if(movingLeft && angle < 30){
                            angle += 30
                        } else if(movingLeft && angle >= 30){
                            angle -= 30
                            movingLeft = false
                        } else if(!movingLeft && angle > -30){
                            angle -= 30
                        } else {
                            angle += 30
                            movingLeft = true
                        }
                    }
                
                
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
            }
                
            
        }
    }
}

struct AlertEmergenciasView_Previews: PreviewProvider {
    static var previews: some View {
        AlertEmergenciasView()
    }
}
