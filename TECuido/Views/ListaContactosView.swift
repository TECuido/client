//
//  ListaContactosView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI

struct ListaContactosView: View {
    @StateObject var viewModel = ListaContactoViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @State private var showDetallesView = false
    @State private var showEditarView = false
    
    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    // Titulo
                    Text("Lista de Contactos")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    // Lista de contacto
                    if viewModel.ejemplo.isEmpty {
                        Image(systemName: "person.crop.circle.fill.badge.xmark")
                            .resizable()
                            .frame(width: 170,height: 150)
                            .foregroundColor(Color(red: 0.8392,green: 0,blue: 0))
                            .padding(20)
                        
                        Text("No hay contactos agregados")
                            .font(.system(size: 40))
                            .bold()
                            .frame(width: 280)
                            .padding()
                            .multilineTextAlignment(.center)
                    } else {
                        List {
                            ForEach(Array(viewModel.ejemplo.enumerated()), id:\.offset) { index, item in
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
                                            title: Text("Eliminar contacto"),
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
                            Text("Contacto Eliminado")
                               
                                .font(.title)
                        ,
                        message: Text("Se eliminó el contacto con éxito")
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
                
                //El boton de agregar
                
                Button(action:{
                    showDetallesView = true
                }){
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 65, height: 65)
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                }
                .padding(.bottom,20)
                .padding(.leading,240)
                
                NavigationLink("", destination: ContactosDetallesView(), isActive: $showDetallesView)
                

                }
            }

        }

    
}


struct ListaContactosView_Previews: PreviewProvider {
    static var previews: some View {
        ListaContactosView()
    }
}
