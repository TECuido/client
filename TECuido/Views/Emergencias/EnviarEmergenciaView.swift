


//
//  NuevaEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 29/12/23.
//

import SwiftUI

struct EnviarEmergenciaView: View {
    
    @Binding var path: NavigationPath
    @StateObject private var viewModel = MandarEmergenciaViewModel()
    var body: some View {
        
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{
                
                Title(text: "Emergencias")
                
                BigText(text: "Selecciona el motivo")
                
                HStack{
                    
                    MiddleButton(
                        title: "Médica",
                        iconName: "heart.circle.fill",
                        hint: "Manda una emergencia médica",
                        isSelected: viewModel.isMedicaSelected
                    ){
                        viewModel.updateSelectedMotivo(motivo: TipoEmergencia.Medica)
                    }
                    
                    MiddleButton(
                        title: "Acoso",
                        iconName: "exclamationmark.triangle.fill",
                        hint: "Manda una emergencia de que estás recibiendo acoso",
                        isSelected: viewModel.isAcosoSelected
                    ){
                        viewModel.updateSelectedMotivo(motivo: TipoEmergencia.Acoso)
                    }
                   
                }
                                
                
                HStack{
                    
                    MiddleButton(
                        title: "Secuestro",
                        iconName: "bolt.horizontal.circle.fill",
                        hint: "Manda una emergencia de secuestro",
                        isSelected: viewModel.isSecuestroSelected
                    ){
                        viewModel.updateSelectedMotivo(motivo: TipoEmergencia.Secuestro)
                    }
                    
                    MiddleButton(
                        title: "Desastre natural",
                        iconName: "tornado",
                        hint: "Manda una emergencia de desastre natural",
                        isSelected: viewModel.isDesastreSelected
                    ){
                        viewModel.updateSelectedMotivo(motivo: TipoEmergencia.Desastre)
                    }
                   
                }
                
                HStack{
                    
                    MiddleButton(
                        title: "Incendio",
                        iconName: "flame.fill",
                        hint: "Manda una emergencia de incendio",
                        isSelected: viewModel.isIncendioSelected
                    ){
                        viewModel.updateSelectedMotivo(motivo: TipoEmergencia.Incendio)
                    }
                    
                    MiddleButton(
                        title: "Accidente de tráfico",
                        iconName: "car.fill",
                        hint: "Manda una emergencia de tipo tráfico",
                        isSelected: viewModel.isTraficoSelected
                    ){
                        viewModel.updateSelectedMotivo(motivo: TipoEmergencia.Trafico)
                    }
                   
                }
                
                HStack{
                    
                    MiddleButton(
                        title: "Extorsión",
                        iconName: "hand.raised.fill",
                        hint: "Manda una emergencia de extorsión",
                        isSelected: viewModel.isExtorsionSelected
                    ){
                        viewModel.updateSelectedMotivo(motivo: TipoEmergencia.Extorsion)
                    }
                    
                    MiddleButton(
                        title: "Emergencia tecnológica",
                        iconName: "antenna.radiowaves.left.and.right",
                        hint: "Manda una emergencia tecnológica",
                        isSelected: viewModel.isTecnologicaSelected
                    ){
                        viewModel.updateSelectedMotivo(motivo: TipoEmergencia.Tecnologica)
                    }
                   
                }
                
                //Selección de contactos
                BigText(text: "Selecciona el grupo a avisar")
                    .padding(.top, 5)

                SelectInput(
                    title: "Selecciona un grupo",
                    selectedOption: $viewModel.selectedOptionContacto,
                    list: viewModel.gruposNombres
                ){
                    Task {
                        await viewModel.getGrupos()
                    }
                }
                .padding(.bottom, -8)
                
                PrimaryButton(title: "Continuar"){
                    Task {
                        await viewModel.addEmergencia()
                        viewModel.resetSelectedMotivos()
                        if(viewModel.showEstatusView){
                            path.append(
                                DataEmergenciaNavModel(
                                    destination: EstatusEmergenciaView.tag,
                                    data: viewModel.dataEmergencia
                                )
                            )
                        }
                    }
                }
                
                
            }
        }
    }
}


struct EnviarEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        EnviarEmergenciaView(path: .constant(NavigationPath()))
    }
}



