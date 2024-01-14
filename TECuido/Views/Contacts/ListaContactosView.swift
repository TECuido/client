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
                                    
                                    NumberedItem(
                                        number: index+1,
                                        title: item.usuarioAgregado.nombre,
                                        subtitle: item.usuarioAgregado.correo
                                    )
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        // Acción para borrar
                                        viewModel.isShowingConfirmationModel = true
                                        viewModel.idAgregado = item.usuarioAgregado.id
                                        
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .resizable()
                                            .foregroundColor(Color("LightBlue"))
                                            .frame(width: 25, height: 25)
                                    }
                                    // Modal
                                    .alert(isPresented: $viewModel.isShowingConfirmationModel) {
                                        OptionsAlert(
                                            title: session.tipoUsuario == 2 ? "Eliminar paciente" : "Eliminar contacto",
                                            message:" ¿Estás seguro de que deseas eliminar el contacto?"
                                        ){
                                            Task {
                                                await viewModel.deleteContactos()
                                            }
                                        }
                                    }
                                } // Acaba el HStack
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
                    path.append(ContactosDetallesView.tag)
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
