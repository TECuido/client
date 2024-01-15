// DatosMedicosView.swift
//  TECuido
//
//  Created by Alumno on 11/01/24.
//
import SwiftUI
struct DatosMedicosView: View {
    @State private var mostrarAlergias = false
    @State private var mostrarCondiciones = false
    @State private var mostrarMedicamentos = false
    @StateObject var viewModel = AlergiaViewModel()
    @StateObject var viewModel1 = CondicionMedicaViewModel()
    @StateObject var viewModel2 = MedicamentosActualesViewModel()
    @State private var showAlergiaEliminarView = false
    @State private var showCondicionEliminarView = false
    @State private var showMedicamentoEliminarView = false
    @Binding var path: NavigationPath
    static var tag = "DatosMedicosView"
    
    var body: some View {
        VStack {
            Color(red: 0.1294,green: 0.5882,blue: 0.9529)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    // Titulo
                    Title(text:"Datos Médicos")
                    // Alergias
                    DisclosureGroup("Alergias", isExpanded: $mostrarAlergias) {
                        VStack(alignment: .leading, spacing: 15) {
                            ForEach(viewModel.alergiasModel, id: \.self) { alergia in
                                HStack{
                                    DisclosureGroupText(labelText: alergia.nombre)
                                    MenuEliminar {
                                                viewModel.alergiaSeleccionada.id = alergia.id
                                                showAlergiaEliminarView = true
                                            }
                                }
                            }
                           
                              HStack {
                                 Spacer()
                                  AgregarButton {
                                      path.append(AlergiaView.tag)
                                  }
                              }
                           }
                        .padding()
                    }
                    .font(.custom("Inter", size: FontSize.text.rawValue))
                    .padding([.leading, .trailing], 15)
                    .onAppear {
                        Task {
                            await viewModel.getAlergias()
                        }
                    }.alert(isPresented: $showAlergiaEliminarView) {
                        Alert(
                            title:
                                Text("Confirmación")
                                .font(.title)
                            ,
                            message: Text("¿Está seguro que desea eliminar esta alergia?")
                                .font(.title2),
                            primaryButton: .destructive(Text("Eliminar")) {
                                Task{
                                    await viewModel.deleteAlergia()
                                    await viewModel.getAlergias()
                                }
                            },
                            secondaryButton: .cancel(Text("Cancelar"))
                        )
                    }
                    // Condiciones Médicas
                    DisclosureGroup("Condiciones Médicas", isExpanded: $mostrarCondiciones) {
                        VStack(alignment: .leading, spacing: 15) {
                            ForEach(viewModel1.condicion, id: \.self) { condiciones in
                                HStack{
                                    DisclosureGroupText(labelText: condiciones.nombre)
                                    MenuEliminar {
                                        viewModel1.condicionSeleccionada.id = condiciones.id
                                        showCondicionEliminarView = true
                                            }
                                }
                            }
                            HStack {
                               Spacer()
                                AgregarButton {
                                    path.append(CondicionMedicaView.tag)
                                }
                            }
                        }
                        .padding()
                    }
                    .font(.custom("Inter", size: FontSize.text.rawValue))
                    .padding([.leading, .trailing], 15)
                    .onAppear {
                        Task {
                            await viewModel1.getCondicionMedica()
                        }
                    }.alert(isPresented: $showCondicionEliminarView) {
                        Alert(
                            title:
                                Text("Confirmación")
                                .font(.title)
                            ,
                            message: Text("¿Está seguro que desea eliminar esta condicionón médica?")
                                .font(.title2),
                            primaryButton: .destructive(Text("Eliminar")) {
                                Task{
                                    await viewModel1.deleteCondicionMedica()
                                    await viewModel1.getCondicionMedica()
                                }
                            },
                            secondaryButton: .cancel(Text("Cancelar"))
                        )
                    }
                    // Condiciones Médicas
                    DisclosureGroup("Medicamentos", isExpanded: $mostrarMedicamentos) {
                        VStack(alignment: .leading, spacing: 15) {
                            ForEach(viewModel2.medicamento, id: \.self) { medicamento in
                                HStack{
                                    DisclosureGroupText(labelText: medicamento.nombre)
                                    MenuEliminar {
                                        viewModel2.medicamentoSeleccionado.id = medicamento.id
                                        showMedicamentoEliminarView = true
                                            }
                                }
                            }
                            HStack {
                               Spacer()
                                AgregarButton {
                                    path.append(MedicamentoActualView.tag)
                                }
                            }
                        }
                        .padding()
                    }
                    .font(.custom("Inter", size: FontSize.text.rawValue))
                    .padding([.leading, .trailing], 15)
                    .onAppear {
                        Task {
                            await viewModel2.getMedicamentosActuales()
                        }
                    }.alert(isPresented: $showMedicamentoEliminarView) {
                        Alert(
                            title:
                                Text("Confirmación")
                                .font(.title)
                            ,
                            message: Text("¿Está seguro que desea eliminar este medicamento?")
                                .font(.title2),
                            primaryButton: .destructive(Text("Eliminar")) {
                                Task{
                                    await viewModel2.deleteMedicamentosActuales()
                                    await viewModel2.getMedicamentosActuales()
                                }
                            },
                            secondaryButton: .cancel(Text("Cancelar"))
                        )
                    }
                        
                    }
                }
            }
        }
    }



    struct DatosMedicosView_Previews: PreviewProvider {
        static var previews: some View {
            DatosMedicosView(path: .constant(NavigationPath()))
        }
    }
