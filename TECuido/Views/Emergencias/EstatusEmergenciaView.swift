//
//  EstatusEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI

struct EstatusEmergenciaView: View {
    
    @Binding var path: NavigationPath
    @State var dataEmergencia: DataEmergenciaModel
    @State private var rotation: Double = 0.0
    
    static var tag = "EstatusEmergenciaView"

    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                
                Title(
                    text: "Se ha enviado una emergencia",
                    color: Color("Red")
                )

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

                Text("Alerta de tipo \(dataEmergencia.tipo)")
                    .font(.custom("Lato", size: FontSize.heading.rawValue))
                    .bold()
                    .foregroundColor(Color("FullScale"))
                    .padding()
                
                
                if((dataEmergencia.descripcion) != nil){
                    Heading(text: "Descripción de la alerta")
                    
                    Text(dataEmergencia.descripcion!)
                        .font(.custom("Lato", size: FontSize.text.rawValue))
                        .foregroundColor(Color("TextColor"))
                        .padding(.bottom, 20)
                } else {
                    Heading(text: "No se agregó la descripción")
                }
                
                
                PrimaryButton(title: "Editar emergencia"){
                    path.append(
                        DataEmergenciaNavModel(
                            destination: EditarEmergenciaView.tag,
                            data: dataEmergencia
                        )
                    )
                }

                
            }
            
        }
        
    }
}

struct EstatusEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        EstatusEmergenciaView(
            path: .constant(NavigationPath()),
            dataEmergencia: DataEmergenciaModel.defaultEmergencia)
    }
}
