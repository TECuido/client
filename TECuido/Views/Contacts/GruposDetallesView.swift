//
//  GruposDetalleView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//



import SwiftUI

struct GruposDetallesView: View {
    
    @Binding var path: NavigationPath
    @StateObject var viewModel = GrupoDetailViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @State private var showDetallesView = false
    
    var grupo: GrupoModel
    
    static var tag = "GruposDetallesView"
   
    var body: some View {
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{
                ScrollView{
                    
                    Spacer()

                    Title(text: grupo.nombre)
                    
                    // Lista de contactos
                    if viewModel.miembros.isEmpty {
                        NoUserIcon()
                        SubTitle(text: "No has agregado aún miembros a este grupo")
                    } else {
                        
                        
                        List{
                            
                            ForEach(Array(viewModel.miembros.enumerated()), id:\.offset) { index,item in
                                HStack{
                                    NumberedBigItem(
                                        number: index+1,
                                        title: item.miembroGrupo.nombre,
                                        text1: item.miembroGrupo.telefono,
                                        text2: item.miembroGrupo.correo ?? ""
                                    )
                                }
                                .listRowBackground(Color("BackgroundColor"))
                                .listRowSeparatorTint(Color("PlaceholderColor"))
                                
                            }
                            
                        }
                        
                        .frame(minHeight: minRowHeight * 12)
                        .scrollContentBackground(.hidden)
                        .listStyle(InsetListStyle())
                        
                    }
    
                    
                }
            }
            .task {
                await viewModel.getMiembros(idGrupo: grupo.id)
            }
        }
    }
}
    
struct GruposDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        GruposDetallesView(path: .constant(NavigationPath()), grupo: GrupoModel.example)
    }
}



