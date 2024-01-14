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
    @State private var showEliminarView = false
    
    @Binding var path: NavigationPath
    
    
    var body: some View {
        
        ZStack {
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView {
                                 
                    Spacer()
                
                    Title(text: "Grupos")
                    
                    if viewModel.grupos.isEmpty {
                        NoUserIcon()
                        
                        SubTitle(text: "No hay grupos agregados")
                    } else {
                        List {
                            ForEach(viewModel.grupos){ item in
                                
                                ZStack {
                                    
                                    NavigationLink(value: item){
                                        EmptyView()
                                    }
                                    
                                    HStack {
                                        Text(item.nombre)
                                            .font(.custom("Lato", size:FontSize.text.rawValue))
                                        
                                        Spacer()
                                        
                                        Menu{
                                            Button(action: {
                                                path.append(GrupoNavigationModel(
                                                        tag: EditarGrupoView.tag,
                                                        grupo: item
                                                    )
                                                )
                                            }){
                                                Label("Editar", systemImage: "pencil")
                                            }

                                            Button(action: {
                                                viewModel.grupoSeleccionado = item
                                                showEliminarView = true
                                            }){
                                                Label("Borrar", systemImage: "trash")
                                            }

                                        } label: {
                                            Image(systemName: "ellipsis.circle")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(Color("LightBlue"))
                                        }
                                        
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .frame(width: 15, height: 20)
                                            .padding(.leading, 15)
                                            .foregroundColor(Color("LightBlue"))
                                        
                                    }
                                    
                                }
                                .padding([.top, .bottom], 10)
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
                    await viewModel.getGrupos()
                }
                .alert(isPresented: $showEliminarView) {
                    OptionsAlert(
                        title: "Eliminar grupo",
                        message: "¿Estás seguro que deseas eliminar este grupo?")
                    {
                        Task{
                            await viewModel.deleteGrupo()
                            await viewModel.getGrupos()
                        }
                    }
                }
                
                
                FloatingActionButton{
                    path.append(CreaGrupoView.tag)
                }
            }
            
        }
    }
}

struct ListaGruposView_Previews: PreviewProvider {
    static var previews: some View {
        ListaGruposView(path: .constant(NavigationPath()))
    }
}

