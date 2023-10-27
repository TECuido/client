//
//  RecetasView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI

struct RecetasView: View {
    @StateObject var viewModel = RecetaViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @State private var showDetallesView = false
    
    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    // Titulo
                    Text("Recetas médicas")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    // Lista de contactos
                    List{
                        ForEach(Array(viewModel.ejemplo.enumerated()), id:\.offset) { index,item in
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
                                    Text(item.nombre ?? "Panfila")
                                        .font(.title2)
                                    Text(item.fecha ?? "2022-04-06")
                                        .font(.title2)
                                    Text(item.doctor ?? "pan@gmail.con")
                                        .font(.title2)
                                    
                                }.padding(15)
                                Button(action:{
                                      showDetallesView = true
                                }){
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.blue)
                                        .padding(.leading, 60)
                                }
                                
                                
                            }
                            
                            
                            
                        }
                        
                    }.frame(minHeight: minRowHeight * 12)
                        .scrollContentBackground(.hidden)
                        .listStyle(InsetListStyle())
                    
                
                    
                    
                    NavigationLink("", destination: MostarRecetaView(), isActive: $showDetallesView)
                }
            }
        }
    }
}

struct RecetasView_Previews: PreviewProvider {
    static var previews: some View {
        RecetasView()
    }
}
