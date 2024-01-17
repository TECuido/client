//
//  MandarEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI


struct EditarEmergenciaView: View {
    
    @Binding var path: NavigationPath
    @StateObject private var viewModel = EditarEmergenciaViewModel()
    var dataEmergencia: DataEmergenciaModel
    
    static var tag = "EditarEmergenciaView"
    
    var body: some View {
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{
                Title(text: "Editar emergencia")
                    .padding(.bottom, 15)
                
                // Selección de motivo
                BigText(text: "Selecciona el motivo de la alerta")
                
                SelectLabelInput(
                    title: "Selecciona un motivo",
                    selectedOption: $viewModel.selectedMotivo,
                    list: viewModel.motivos,
                    iconMap: viewModel.motivoIconMapping
                ){}
                    .padding(.bottom, 15)
                
                //Selección de contactos
                BigText(text: "Selecciona el grupo a avisar")

                SelectInput(
                    title: "Selecciona un grupo",
                    selectedOption: $viewModel.selectedOptionContacto,
                    list: viewModel.gruposNombres
                ){
                    Task {
                        await viewModel.getGrupos()
                    }
                }
                .padding(.bottom, 15)
                
                //descripcion
                VStack {
                    BigText(text: "Agrega una descripción")
                    
                    // Opción para elegir entre nivel de gravedad y texto descriptivo
                    Picker("Selecciona una opción", selection: $viewModel.isNivelGravedadSelected) {
                        Text("Nivel de gravedad")
                            .tag(true)
                        Text("Descripción")
                            .tag(false)
                    }
                    .font(.custom("Lato", size: FontSize.text.rawValue))
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 10)
                    
                    // Mostrar el campo de nivel de gravedad o el editor para la descripción
                    if viewModel.isNivelGravedadSelected {
                        SelectInput(
                            title: "Nivel de gravedad",
                            selectedOption:
                                $viewModel.nivel,
                            list: (1...10).map{"\($0)"}
                        ){}
                    } else {
                        PlaceholderTextEditor(
                            text: $viewModel.descripcion,
                            placeholder: "Escribe una descripción")
                    }
                }
               
                PrimaryButton(title: "Guardar cambios"){
                    Task {
                        await viewModel.editEmergencia()
                    }
                }
                .alert(isPresented: $viewModel.emergenciaEditada) {
                    AcceptAlert(
                        title: "Emergencia actualizada",
                        message: "Se han actualizado los datos de la emergencia"
                    ){
                        path.removeLast()
                    }
                }
                
            }
            
        }
        .onAppear(){
            viewModel.idEmergencia = dataEmergencia.idEmergencia
            viewModel.descripcion = dataEmergencia.descripcion ?? ""
            viewModel.selectedMotivo = dataEmergencia.tipo            
        }
    }
}

struct EditarEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        EditarEmergenciaView(
            path: .constant(NavigationPath()),
            dataEmergencia: DataEmergenciaModel.defaultEmergencia
        )
    }
}

