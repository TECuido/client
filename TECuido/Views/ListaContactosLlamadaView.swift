//
//  ListaContactosLlamadaView.swift
//  TECuido
//
//  Created by Alumno on 30/10/23.
//

import SwiftUI

struct ListaContactosLlamadaView: View {
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @StateObject var viewModel = ListaContactosLlamadaViewModel()
    @State var showLlamadaView = false
    
    var body: some View {
        
        ZStack{
            VStack{
                ScrollView{
                    // Titulo
                    Text("Lista de Contactos para llamar")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    // Lista de contactos
                    List{
                        ForEach(Array(viewModel.contactos.enumerated()), id:\.offset) { index,item in
                            HStack{
                                ZStack{
                                    Circle()
                                        .fill(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                                        .frame(width: 40, height: 40)
                                    Text("\(index+1)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                }
                                
                                ZStack {
                                    
                                    NavigationLink(destination: LlamadasTemporalView()){
                                        EmptyView()
                                    }
                                    
                                    HStack {
                                        VStack(alignment: .leading){
                                            Text(item.usuarioAgregado.nombre)
                                                .font(.title2)
                                            Text(item.usuarioAgregado.correo)
                                                .font(.title2)
                                        }.padding(15)
                                        
                                        Spacer()
                                        
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.blue)
                                        
                                    }
                                }
                            }
                            
                        }
                    }
                    .task {
                        await viewModel.getContactos()
                    }
                    .frame(minHeight: minRowHeight * 12)
                        .scrollContentBackground(.hidden)
                        .listStyle(InsetListStyle())
                    
                }
            }
        }
    }
}

struct ListaContactosLlamadaView_Previews: PreviewProvider {
    static var previews: some View {
        ListaContactosLlamadaView()
    }
}
