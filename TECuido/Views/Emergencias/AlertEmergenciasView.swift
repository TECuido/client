//
//  EmergenciasView.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct AlertEmergenciasView: View {
    
    @Binding var path: NavigationPath
    @State private var rotation: Double = 0.0
    @State private var viewModel = AlertEmergenciasViewModel()
    @Binding var dataEmergencia: DataEmergenciaModel
    
    
    var body: some View {
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{
                
                Title(
                    text: "Emergencias",
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
                
                // Texto de alerta
                if((dataEmergencia.descripcion) != nil){
                    Heading(text: "Descripción de la alerta")
                    
                    Text(dataEmergencia.descripcion!)
                        .font(.custom("Lato", size: FontSize.text.rawValue))
                        .foregroundColor(Color("TextColor"))
                        .padding(.bottom, 20)
                } else {
                    Heading(text: "No se agregó la descripción")
                }
            
            
                if(dataEmergencia.emisor != nil){
                    Heading(text: "Enviado por:")
                    
                    Text(dataEmergencia.emisor!)
                        .font(.custom("Lato", size: FontSize.text.rawValue))
                        .foregroundColor(Color("TextColor"))
                        .padding(.bottom, 10)
                }
                
                if(dataEmergencia.longitud != nil){
                    PrimaryButton(title: "Ubicación"){
                        viewModel.updateCoordinates(
                            latitude: dataEmergencia.latitud ?? 0,
                            longitude: dataEmergencia.longitud ?? 0)
                        path.append(MapaNavModel(
                            region: $viewModel.region,
                            markers: $viewModel.markers
                        ))
                    }
                }
                
            }
        }
    }
}

struct AlertEmergenciasView_Previews: PreviewProvider {
    static var previews: some View {
        AlertEmergenciasView(path: .constant(NavigationPath()), dataEmergencia: .constant( DataEmergenciaModel.defaultEmergencia))
    }
}
