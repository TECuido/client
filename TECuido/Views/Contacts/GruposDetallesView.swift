//
//  GruposDetalleView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//



import SwiftUI

struct GruposDetallesView: View {
    
    @Binding var path: NavigationPath
    @State var grupo: GrupoModel
    @StateObject var viewModel = GrupoDetailViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @State private var showDetallesView = false
    
    static var tag = "EditarGrupoView"
   
    
    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    // Titulo
                    Text("\(grupo.nombre)")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    // Lista de contactos
                    
                    if viewModel.miembros.isEmpty {
                        Image(systemName: "person.crop.circle.fill.badge.xmark")
                            .resizable()
                            .frame(width: 170,height: 170)
                            .foregroundColor(Color(red: 0.8392,green: 0,blue: 0))
                            .padding(20)
                        
                        Text("No hay contactos agregados")
                            .font(.system(size: 40))
                        .bold()
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                       
                        
                       

                    } else {
                        
                        
                        List{
                            
                            ForEach(Array(viewModel.miembros.enumerated()), id:\.offset) { index,item in
                                HStack{
                                    ZStack{
                                        Circle()
                                            .fill(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                                            .frame(width: 40, height: 40)
                                        Text("\(index+1)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                    }
                                    
                                    VStack(alignment: .leading){
                                        Text(item.miembroGrupo.nombre)
                                            .font(.title2)
                                        Text(item.miembroGrupo.correo)
                                            .font(.title2)
                                    }.padding(15)
                                }
                                
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



