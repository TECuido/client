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
    @State private var showDetallesView = false
    @State private var showEditarView = false
    
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
                        Image(systemName: "person.crop.circle.fill.badge.xmark")
                            .resizable()
                            .frame(width: 180,height: 150)
                            .foregroundColor(Color("Red"))
                            .padding(20)
                        
                        SubTitle(text: session.tipoUsuario == 2 ? "No hay pacientes agregados" : "No hay contactos agregados")
        
                    } else {
                        List {
                            ForEach(Array(viewModel.contactos.enumerated()), id:\.offset) {  index, item in
                                HStack(alignment: .center) {
                                    
                                    ZStack {
                                        Circle()
                                            .fill(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                            .frame(width: 40, height: 40)
                                        Text("\(index + 1)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                    }
                                    VStack(alignment: .leading) {
                                        Text(item.usuarioAgregado.nombre)
                                            .font(.title2)
                                        Text(item.usuarioAgregado.correo)
                                            .font(.title2)
                                    }.frame(width:.infinity)
                                        .padding(10)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        // Acción para borrar
                                        viewModel.isShowingConfirmationModel = true
                                        viewModel.idAgregado = item.usuarioAgregado.id
                                        
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .resizable()
                                            .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                            .frame(width: 30, height: 30)
                                    }
                                    // Modal
                                    .alert(isPresented: $viewModel.isShowingConfirmationModel) {
                                        Alert(
                                            title: Text(session.tipoUsuario == 2 ? "Eliminar paciente" : "Eliminar contacto"),
                                            message: Text("¿Estás seguro de que deseas eliminar el contacto?"),
                                            primaryButton: .default(
                                                Text("Aceptar")
                                                    .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529)),
                                                action: {
                                                    Task{
                                                        await viewModel.deleteContactos()
                                                    }
                                                }
                                            ),
                                            secondaryButton: .cancel(
                                                Text("Cancelar")
                                                    .foregroundColor(.red)
                                            )
                                        )
                                    }
                                    
                                    
                                    
                                    
                                } // Acaba el HStack
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
                    Alert(
                        title:
                            Text(session.tipoUsuario == 2 ? "Paciente eliminado" : "Contacto eliminado")
                        
                            .font(.title)
                        ,
                        message: Text(session.tipoUsuario == 2 ? "Se eliminó el paciente con éxito" : "Se eliminó el contacto con éxito")
                            .font(.title2),
                        dismissButton: .default(
                            Text("OK")
                                .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529)),
                            action: {
                                Task {
                                    viewModel.borrado = false
                                    await viewModel.getContactos()
                                }
                            }
                        )
                    )
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
