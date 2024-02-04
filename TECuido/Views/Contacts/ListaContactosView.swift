//
//  ListaContactosView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI

struct ListaContactosView: View {
    
    @EnvironmentObject var session: SessionManager
    @StateObject var viewModel = ListaContactoViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @StateObject var viewModelContacto = GetUsuarioDetallesViewModel()
    @State var showAviso: Bool = false
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{
                ScrollView{
                    Spacer()
                    
                    Title(text: session.tipoUsuario == 2 ? "Lista de Pacientes" : "Lista de Contactos")
                    
                    // Lista de contacto
                    if viewModel.contactos.isEmpty {
                        NoUserIcon()
                        
                        SubTitle(text: session.tipoUsuario == 2 ? "No hay pacientes agregados" : "No hay contactos agregados")
        
                    } else {
                        List {
                            ForEach(Array(viewModel.contactos.enumerated()), id:\.offset) {  index, item in
                            
                                    
                                HStack(alignment: .center) {
                                    
                                    NumberedBigItem(
                                        number: index+1,
                                        title: item.nombre,
                                        text1: item.telefono,
                                        text2: item.correo ?? ""
                                        
                                    )
                                    
                                    Spacer()
                                    Menu {
                                        Button(action: {
                                            path.append(ContactoNavigationModel(
                                                    tag: EditarContactosView.tag,
                                                    contacto: item
                                                )
                                            )
                                        }){
                                            Label("Editar", systemImage: "pencil")
                                        }
                                        
                                        if let contactoEmergencia = viewModelContacto.usuarioDetalles.first?.contactoEmergencia,
                                           contactoEmergencia.telefono == item.telefono {
                                            Button(action: {
                                                // Acción para mostar el aviso
                                                showAviso = true
                                                viewModel.isShowingConfirmationModel = true
                                            }) {
                                                Label("Advertencia", systemImage: "exclamationmark.triangle.fill")
                                            }
                                                                                    } else {
                                            Button(action: {
                                                // Acción para borrar
                                                showAviso = false
                                                viewModel.isShowingConfirmationModel = true
                                                viewModel.idContacto = item.id
                                            }) {
                                                Label("Borrar", systemImage: "trash")
                                            }
                                            
                                        }
                                    } label: {
                                        Image(systemName: "ellipsis.circle")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(Color("LightBlue"))
                                    }
                                    

                                    }
                                
                                .alert(isPresented: $viewModel.isShowingConfirmationModel) {
                                    print(showAviso)
                                    if(showAviso){
                                        return AcceptAlert(
                                            title: "Contacto de Emergencia",
                                            message:"No se puede eliminar el contacto de emergencia"
                                        ) {
                                            // Handle alert action
                                        }
                                    }else if(viewModel.isShowingConfirmationModel && !showAviso){
                                       return  OptionsAlert(
                                            title: session.tipoUsuario == 2 ? "Eliminar paciente" : "Eliminar contacto",
                                            message:" ¿Estás seguro de que deseas eliminar el contacto?"
                                        ) {
                                            Task {
                                                await viewModel.deleteContactos()
                                            }
                                        }
                                        
                                    } else{
                                        return  OptionsAlert(
                                             title: session.tipoUsuario == 2 ? "Eliminar paciente" : "Eliminar contacto",
                                             message:" ¿Estás seguro de que deseas eliminar el contacto?"
                                         ) {
                                             Task {
                                                 await viewModel.deleteContactos()
                                             }
                                         }

                                    }
                                       
                                    }// Acaba el HStack
                                    .listRowBackground(Color("BackgroundColor"))
                                    .listRowSeparatorTint(Color("PlaceholderColor"))
                               
                            }
                        }
                        .frame(minHeight: minRowHeight * 10)
                        .scrollContentBackground(.hidden)
                        .listStyle(InsetListStyle())
                    }
                    
                }
                .task {
                    await viewModel.getContactos()
                    await viewModelContacto.getUsuarioDetalles()
                }
                // Modal
                .alert(isPresented: $viewModel.borrado) {
                    AcceptAlert(
                        title: session.tipoUsuario == 2 ? "Paciente eliminado" : "Contacto eliminado",
                        message: session.tipoUsuario == 2 ? "Se eliminó el paciente con éxito" : "Se eliminó el contacto con éxito"
                    ){
                        Task {
                            viewModel.borrado = false
                            await viewModel.getContactos()
                        }
                    }
                }
                
                FloatingActionButton{
                    path.append(CrearContactoView.tag)
                }
                
            }
        }
        
    }
    
}


struct ListaContactosView_Previews: PreviewProvider {
    static var previews: some View {
        ListaContactosView(path: .constant(NavigationPath()))
            .environmentObject(SessionManager())
    }
}
