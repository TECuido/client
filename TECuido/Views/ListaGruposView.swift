//
//  GruposView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI


struct ListaGruposView: View {
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    @StateObject var viewModel = ListaGrupoViewModel()
    @State private var showDetallesView = false
    @State private var showAgregaView = false
    
    @State private var showEditarView = false
        @State private var showEliminarView = false
    
    var body: some View {
        
        ZStack {

            Color(red: 0.98, green: 0.98, blue: 0.98)
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    
                    Text("Grupos")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    List {
                        ForEach(viewModel.grupos){ item in
                            
                            ZStack {
                                
                                NavigationLink(destination: GruposDetallesView(grupo: item)){
                                    EmptyView()
                                }
                                
                                HStack {
                                    Text(item.nombre)
                                        .listRowBackground(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        .padding([.top, .bottom], 10)
                                        .font(.title2)
                                    
                                    Spacer()
                                    
                                    Menu{
                                                                            Button(action: {
                                                                                viewModel.grupoSeleccionado = item
                                                                                showEditarView = true

                                                                            }){
                                                                                Label("Editar", systemImage: "pencil")
                                                                            }

                                                                            Button(action: {
                                                                                viewModel.grupoSeleccionado = item
                                                                                showEliminarView = true
                                                                            }){
                                                                                Label("Borrar", systemImage: "trash")
                                                                            }

                                                                        }label: {
                                                                            Image(systemName: "ellipsis.circle")
                                                                                .frame(width: 30, height: 30)
                                                                                .foregroundColor(.blue)
                                                                        }
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.blue)                                    
                                    
                                }
                            }
                        }
                    }
                    .task {
                        await viewModel.getGrupos()
                    }
                    .alert(isPresented: $showEliminarView) {
                                            Alert(
                                                title:
                                                    Text("Confirmación")

                                                    .font(.title)
                                                ,
                                                message: Text("¿Está seguro que desea eliminar este grupo?")
                                                    .font(.title2),
                                                primaryButton: .destructive(Text("Eliminar")) {
                                                    Task{
                                                        await viewModel.deleteGrupo()
                                                        await viewModel.getGrupos()
                                                    }
                                                },
                                                secondaryButton: .cancel(Text("Cancelar"))
                                            )
                                        }
                    .frame(minHeight: minRowHeight * 10)
                    .scrollContentBackground(.hidden)
                    
                    
                    VStack{
                        Button(action:{
                              showAgregaView = true
                        }){
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 20)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                     
                     NavigationLink("", destination: CreaGrupoView(), isActive: $showAgregaView)

                }
            }
        }
        .background(
                            NavigationLink("", destination:
                                            EditarGrupoView(grupo: viewModel.grupoSeleccionado), isActive: $showEditarView)
                )
    }
}

struct ListaGruposView_Previews: PreviewProvider {
    static var previews: some View {
        ListaGruposView()
    }
}

