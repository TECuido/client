//
//  MostarRecetaView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI

struct MostrarRecetaView: View {
    
    @Binding var path: NavigationPath
    @State var receta: RecetaModel
    @StateObject var viewModel = RecetaViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight

    
    var body: some View {
        
        
        ZStack {
            
            Color("BackgroundColor")
                .ignoresSafeArea()
        
            VStack{
                
                ScrollView {
                    
                    Title(text: receta.nombre)
                    
                    if(viewModel.recetaMedicamentos.medicamentoReceta.isEmpty){
                        NoPrescriptionIcon()
                        SubTitle(text: "Aún no hay medicamentos agregados a la receta")
                    } else {
                        List {
                            ForEach(viewModel.recetaMedicamentos.medicamentoReceta){ item in
                                
                                    ZStack{
                                        
                                        NavigationLink(value: item){
                                            EmptyView()
                                        }
                                        
                                        HStack(alignment: .center) {
                                            
                                            IconBigItem(
                                                iconName: "pill.circle.fill",
                                                color: Color("LightBlue"),
                                                title: item.nombre,
                                                text1: "\(item.dosis) \(item.frecuencia.lowercased())",
                                                text2: "Duración: \(item.duracion)"
                                            )
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.blue)
                                            
                                        }
                                        .padding(.bottom, 5)
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
                await viewModel.getMedicamentos(idReceta: receta.id)
            }
                    
        }
    }
}

struct MostarRecetaView_Previews: PreviewProvider {
    static var previews: some View {
        MostrarRecetaView(path: .constant(NavigationPath()), receta: RecetaModel.defaultReceta)
    }
}
