


//
//  NuevaEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 29/12/23.
//

import SwiftUI

struct NuevaEmergenciaView: View {
    


    @StateObject private var viewModel = MandarEmergenciaViewModel()
    var body: some View {
        
        ZStack{
            VStack{
                Text("Emergencias")
                    .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .font(.system(size: 40))
                    .bold()
                   
                //Fila 1
                HStack{
                    //Boton Medico Inicia
                    Button(action: {
                        viewModel.isMedicaSelected.toggle()
                        if viewModel.isMedicaSelected {
                            viewModel.isAcosoSelected = false
                            viewModel.isSecuestroSelected = false
                            viewModel.isDesastreSelected = false
                            viewModel.isIncendioSelected = false
                            viewModel.isTraficoSelected = false
                            viewModel.isExtorsionSelected = false
                            viewModel.isTecnologicaSelected = false
                            viewModel.selectedMotivo = "Medica"
                            viewModel.descripcion = "He tenido una emergencia medica por favor ven a ayudarme"
                            }

                    }) {
                        BotonEmergencia(title: "Médica", iconName: "heart.circle.fill", hint: "Manda una notificacion de una emergencia medica")
                    }.background(viewModel.isMedicaSelected ? Color.blue.opacity(0.5) : Color.clear)
                    //Boton Medico acaba
                    
                    // Boton Acoso
                    Button(action: {
                        viewModel.isAcosoSelected.toggle()
                        if viewModel.isAcosoSelected {
                            viewModel.isMedicaSelected = false
                            viewModel.isSecuestroSelected = false
                            viewModel.isDesastreSelected = false
                            viewModel.isIncendioSelected = false
                            viewModel.isTraficoSelected = false
                            viewModel.isExtorsionSelected = false
                            viewModel.isTecnologicaSelected = false
                            
                        viewModel.selectedMotivo = "Acoso"
                        viewModel.descripcion = "Ayudame me estan acosando, ven pronto"
                        }
                    }) {
                        BotonEmergencia(title: "Acoso", iconName: "exclamationmark.triangle.fill", hint: "Manda una notificacion de que estas recibiendo acoso")
                    }.background(viewModel.isAcosoSelected ? Color.blue.opacity(0.5) : Color.clear)
                   //  Fin boton Acoso
                   
                }
                
                HStack{
                    
                    // Inicio boton Secuestro
                    Button(action: {
                        viewModel.isSecuestroSelected.toggle()
                        if viewModel.isSecuestroSelected {
                            viewModel.isMedicaSelected = false
                            viewModel.isAcosoSelected = false
                            viewModel.isDesastreSelected = false
                            viewModel.isIncendioSelected = false
                            viewModel.isTraficoSelected = false
                            viewModel.isExtorsionSelected = false
                            viewModel.isTecnologicaSelected = false
                        viewModel.selectedMotivo = "Secuestro"
                        viewModel.descripcion = "Estoy teniendo un intento de secuestro "
                        }
                    }) {
                        BotonEmergencia(title:  "Secuestro", iconName: "bolt.horizontal.circle.fill", hint: "Manda una notificacion de que estas siendo secuestrado")
                    }.background(viewModel.isSecuestroSelected ? Color.blue.opacity(0.5) : Color.clear)
                    //  Fin boton Secuestro
                    // Boton desastre inicio
                    Button(action: {
                        viewModel.isDesastreSelected.toggle()
                        if viewModel.isDesastreSelected {
                            viewModel.isMedicaSelected = false
                            viewModel.isAcosoSelected = false
                            viewModel.isSecuestroSelected = false
                            viewModel.isIncendioSelected = false
                            viewModel.isTraficoSelected = false
                            viewModel.isExtorsionSelected = false
                            viewModel.isTecnologicaSelected = false
                        viewModel.selectedMotivo = "Desastre natural"
                        viewModel.descripcion = "Ha sucedido un desastre natural"
                        }
                    }) {
                        BotonEmergencia(title: "Desastre natural", iconName: "tornado", hint: "Manda una notificacion de un desastre natural")
                    }.background(viewModel.isDesastreSelected ? Color.blue.opacity(0.5) : Color.clear)
                    // Fin desastre
                }
                
                //Fila 2
                HStack{
                    
                    
                    // Inicio incendio
                    Button(action: {
                        viewModel.isIncendioSelected.toggle()
                        if viewModel.isIncendioSelected {
                            viewModel.isMedicaSelected = false
                            viewModel.isAcosoSelected = false
                            viewModel.isSecuestroSelected = false
                            viewModel.isDesastreSelected = false
                            viewModel.isTraficoSelected = false
                            viewModel.isExtorsionSelected = false
                            viewModel.isTecnologicaSelected = false
                        viewModel.selectedMotivo = "Incendio"
                        viewModel.descripcion = "Esta sucediendo un incendio"
                        }
                    }) {
                        BotonEmergencia(title: "Incendio", iconName: "flame.fill", hint: "Recibe recomendaciones de qué hacer ante quemaduras, heridas y picaduras")
                    }.background(viewModel.isIncendioSelected ? Color.blue.opacity(0.5) : Color.clear)
                    // Fin incendio
                  
                    // Inicio Trafico
                    Button(action: {
                        viewModel.isTraficoSelected.toggle()
                        if viewModel.isTraficoSelected {
                            viewModel.isMedicaSelected = false
                            viewModel.isAcosoSelected = false
                            viewModel.isSecuestroSelected = false
                            viewModel.isDesastreSelected = false
                            viewModel.isIncendioSelected = false
                            viewModel.isExtorsionSelected = false
                            viewModel.isTecnologicaSelected = false
                        viewModel.selectedMotivo = "Accidente de trafico"
                        viewModel.descripcion = "He tenido un accidente de trafico, ven a ayudarme"
                        }
                    }) {
                        BotonEmergencia(title:  "Accidente de tráfico", iconName: "car.fill", hint: "Manda una notificacion que has tenido un accidente de trafico")
                    }.background(viewModel.isTraficoSelected ? Color.blue.opacity(0.5) : Color.clear)
                    // Fin trafico
                }
                //Fila 3
                
                HStack{
                    //  Inicio Extorsion
                    Button(action: {
                        viewModel.isExtorsionSelected.toggle()
                        if viewModel.isExtorsionSelected{
                            viewModel.isMedicaSelected = false
                            viewModel.isAcosoSelected = false
                            viewModel.isSecuestroSelected = false
                            viewModel.isDesastreSelected = false
                            viewModel.isIncendioSelected = false
                            viewModel.isTraficoSelected = false
                            viewModel.isTecnologicaSelected = false
                        viewModel.selectedMotivo = "Extorsion"
                        viewModel.descripcion = "Estoy siendo victima de una extorsion"
                        }
                    }) {
                        BotonEmergencia(title: "Extorsión", iconName: "hand.raised.fill", hint: "Manda una emergencia de que te estan extorsionando")
                    }.background(viewModel.isExtorsionSelected ? Color.blue.opacity(0.5) : Color.clear)
                  // Fin extorsion
                    
                    //Inicio tecnologica
                    Button(action: {
                        viewModel.isTecnologicaSelected.toggle()
                        if viewModel.isTecnologicaSelected{
                            viewModel.isMedicaSelected = false
                            viewModel.isAcosoSelected = false
                            viewModel.isSecuestroSelected = false
                            viewModel.isDesastreSelected = false
                            viewModel.isIncendioSelected = false
                            viewModel.isTraficoSelected = false
                            viewModel.isExtorsionSelected = false
                        viewModel.selectedMotivo = "Emergencia tecnologica"
                        viewModel.descripcion = "He tenido una emergencia tecnologica por favor ven a ayudarme"
                        }
                    }) {
                        BotonEmergencia(title: "Emergencia tecnológica", iconName: "antenna.radiowaves.left.and.right", hint: "Recibe recomendaciones de qué hacer ante quemaduras, heridas y picaduras")
                    }.background(viewModel.isTecnologicaSelected ? Color.blue.opacity(0.5) : Color.clear)
                   
                }
                //Selección de contactos
                Text("Selecciona los grupos a avisar")
                    .font(.title2)
                    .frame(width:340)
                    .multilineTextAlignment(.center)
                
                Picker("Selecciona un grupo", selection: $viewModel.selectedOptionContacto){
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
                        viewModel.resetSelectedMotivos()
                    }
                }
                .foregroundColor(.white)
                .bold()
                .frame(width: 300, height: 45)
                .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                .cornerRadius(25)
                .padding(5)
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
                    .frame(width: 30, height: 30)
            }
            .frame(width: 145, height: 100)
            .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
            .cornerRadius(16)
            
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



