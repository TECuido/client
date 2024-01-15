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
            ScrollView {
                VStack {
                    // Titulo
                    Text("Datos Médicos")
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .font(.system(size: 50))
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(.top, 30)
                        .multilineTextAlignment(.center)
                    // Alergias
                    DisclosureGroup("Alergias", isExpanded: $mostrarAlergias) {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel.alergiasModel, id: \.self) { alergia in
                                HStack{
                                    Text(alergia.nombre)
                                        .font(.headline)
                                        .frame(width: 200)
                                        .font(.system(size: 25))
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                                    Menu{
                                        
                                        Button(action: {
                                            viewModel.alergiaSeleccionada.id = alergia.id
                                            showAlergiaEliminarView = true
                                        }){
                                            Label("Borrar", systemImage: "trash")
                                        }
                                    }label: {
                                        Image(systemName: "ellipsis.circle")
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                           
                              HStack {
                                 Spacer()
                                  Button {
                                      path.append(AlergiaView.tag)
                                  } label: {
                                      Image(systemName: "plus")
                                          .foregroundColor(Color.blue)
                                          .font(.headline)
                                          .padding()
                                          .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                                  }

                              }
                           }
                        
                        .padding()
                    }
                    .font(.system(size: 20))
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
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel1.condicion, id: \.self) { condiciones in
                                HStack{
                                    Text(condiciones.nombre)
                                        .font(.headline)
                                        .frame(width: 200)
                                        .font(.system(size: 25))
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                                    Menu{
                                        
                                        Button(action: {
                                            viewModel1.condicionSeleccionada.id = condiciones.id
                                            showCondicionEliminarView = true
                                        }){
                                            Label("Borrar", systemImage: "trash")
                                        }
                                    }label: {
                                        Image(systemName: "ellipsis.circle")
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.blue)
                                    }
                                    
                                }
                            }
                            Button {
                                path.append(CondicionMedicaView.tag)
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(Color.blue)
                                    .font(.headline)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                            }
                        }
                        .padding()
                    }
                    .font(.system(size: 20))
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
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel2.medicamento, id: \.self) { medicamento in
                                HStack{
                                    Text(medicamento.nombre)
                                        .font(.headline)
                                        .frame(width: 200)
                                        .font(.system(size: 25))
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                                    Menu{
                                        
                                        Button(action: {
                                            viewModel2.medicamentoSeleccionado.id = medicamento.id
                                            showMedicamentoEliminarView = true
                                        }){
                                            Label("Borrar", systemImage: "trash")
                                        }
                                    }label: {
                                        Image(systemName: "ellipsis.circle")
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.blue)
                                    }
                                    
                                }
                            }
                            Button {
                                path.append(MedicamentoActualView.tag)
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(Color.blue)
                                    .font(.headline)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                            }
                        }
                        .padding()
                    }
                    .font(.system(size: 20))
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
            }.background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
        }
    }


    struct DatosMedicosView_Previews: PreviewProvider {
        static var previews: some View {
            DatosMedicosView(path: .constant(NavigationPath()))
        }
    }
