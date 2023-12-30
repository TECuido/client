//
//  NuevaEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 29/12/23.
//

import SwiftUI

struct NuevaEmergenciaView: View {
    
    @State private var isMedicaSelected = false
    @State private var isAcosoSelected = false

    @StateObject private var viewModel = MandarEmergenciaViewModel()
    var body: some View {
        
        ZStack{
            VStack{
                Text("Emergencias")
                    .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .font(.system(size: 45))
                    .bold()
                    .padding()
                //Fila 1
                HStack{
                    
                   
                    Button(action: {
                        
                        isMedicaSelected.toggle()
                        if isMedicaSelected {
                            isAcosoSelected = false
                            viewModel.selectedMotivo = "Medica"
                            viewModel.descripcion = "He tenido una emergencia medica por favor ven a ayudarme"
                            }

                    }) {
                        BotonEmergencia(title: "Médica", iconName: "heart.circle.fill", hint: "Manda una notificacion de una emergencia medica")
                    }.background(isMedicaSelected ? Color.blue.opacity(0.5) : Color.clear)
                    
                    Button(action: {
                        isAcosoSelected.toggle()
                        if isAcosoSelected {
                            isMedicaSelected = false
                            
                        viewModel.selectedMotivo = "Acoso"
                        viewModel.descripcion = "Ayudame me estan acosando, ven pronto"
                        }
                    }) {
                        BotonEmergencia(title: "Acoso", iconName: "exclamationmark.triangle.fill", hint: "Manda una notificacion de que estas recibiendo acoso")
                    }.background(isAcosoSelected ? Color.blue.opacity(0.5) : Color.clear)
                   
                    Button(action: {
                        viewModel.selectedMotivo = "Secuestro"
                        viewModel.descripcion = "Estoy teniendo un intento de secuestro "
                    }) {
                        BotonEmergencia(title:  "Secuestro", iconName: "bolt.horizontal.circle.fill", hint: "Manda una notificacion de que estas siendo secuestrado")
                    }
                }
                
                //Fila 2
                HStack{
                    Button(action: {
                        viewModel.selectedMotivo = "Desastre natural"
                        viewModel.descripcion = "Ha sucedido un desastre natural"
                    }) {
                        BotonEmergencia(title: "Desastre natural", iconName: "tornado", hint: "Manda una notificacion de un desastre natural")
                    }
                    
                
                    Button(action: {
                        viewModel.selectedMotivo = "Incendio"
                        viewModel.descripcion = "Esta sucediendo un incendio"
                    }) {
                        BotonEmergencia(title: "Incendio", iconName: "flame.fill", hint: "Recibe recomendaciones de qué hacer ante quemaduras, heridas y picaduras")
                    }
                  
                    Button(action: {
                        viewModel.selectedMotivo = "Accidente de trafico"
                        viewModel.descripcion = "He tenido un accidente de trafico, ven a ayudarme"
                    }) {
                        BotonEmergencia(title:  "Accidente de tráfico", iconName: "car.fill", hint: "Manda una notificacion que has tenido un accidente de trafico")
                    }
                }
                //Fila 3
                
                HStack{
                    Button(action: {
                        viewModel.selectedMotivo = "Extorsion"
                        viewModel.descripcion = "Estoy siendo victima de una extorsion"
                    }) {
                        BotonEmergencia(title: "Extorsión", iconName: "hand.raised.fill", hint: "Manda una emergencia de que te estan extorsionando")
                    }
                  
                    Button(action: {
                        viewModel.selectedMotivo = "Emergencia tecnologica"
                        viewModel.descripcion = "He tenido una emergencia tecnologica por favor ven a ayudarme"
                    }) {
                        BotonEmergencia(title: "Emergencia tecnológica", iconName: "antenna.radiowaves.left.and.right", hint: "Recibe recomendaciones de qué hacer ante quemaduras, heridas y picaduras")
                    }
                   
                }
                Picker("Selecciona un contacto", selection: $viewModel.selectedOptionContacto){
                    ForEach(viewModel.gruposNombres, id: \.self) { grupo in
                        Text(grupo)
                            .font(.title)
                    }
                }
                .task {
                    await viewModel.getGrupos()
                }
                // Acaban las filas
                Button("Continuar") {
                    Task {
                        
                        await viewModel.addEmergencia()
                        isMedicaSelected = false
                        isAcosoSelected = false
                    }
                }
                .foregroundColor(.white)
                .bold()
                .frame(width: 300, height: 65)
                .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                .cornerRadius(25)
                .padding(30)
                .font(.title2)
        }
            
            NavigationLink("", destination: EstatusEmergenciaView(dataEmergencia: viewModel.dataEmergencia), isActive: $viewModel.showEstatusView)
            
            NavigationLink("", destination: TECuidoView(), isActive: $viewModel.failedAuthentication)
                                    
        
            }
        }
    }
    private func BotonEmergencia(title: String, iconName: String, hint: String) -> some View {
                
        ZStack {
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.title2)
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
            }
            .frame(width: 115, height: 130)
            .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
            .cornerRadius(16)
            .padding(5)
            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
            .font(.title)
            .accessibilityLabel(title)
            .accessibilityHint(hint)
        }
        
    }


struct NuevaEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        NuevaEmergenciaView()
    }
}
