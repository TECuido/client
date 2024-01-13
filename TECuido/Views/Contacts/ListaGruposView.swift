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
            
            ScrollView {
                             
                Spacer()
            
                Title(text: "Grupos")
                
                if viewModel.grupos.isEmpty {
                    Image(systemName: "person.crop.circle.fill.badge.xmark")
                        .resizable()
                        .frame(width: 180,height: 150)
                        .foregroundColor(Color("Red"))
                        .padding(20)
                    
                    SubTitle(text: "No hay grupos agregados")
                }
                else {
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
                                                    tag: GruposDetallesView.tag,
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

                                    }label: {
                                        Image(systemName: "ellipsis.circle")
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color("LightBlue"))
                                    }
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.blue)
                                    
                                }
                                
                            }
                            .listRowBackground(Color("BackgroundColor"))
                            .listRowSeparatorTint(Color("PlaceholderColor"))
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
                    .frame(minHeight: minRowHeight * 10)
                    .scrollContentBackground(.hidden)
                    .listStyle(InsetListStyle())
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

