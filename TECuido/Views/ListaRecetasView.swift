//
//  RecetasView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI

struct ListaRecetasView: View {
    @StateObject var viewModel = ListaRecetasViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
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
                        ForEach(Array(viewModel.recetas.enumerated()), id:\.offset) { index,item in
                            
                            ZStack {
                                NavigationLink("", destination: MostrarRecetaView(receta: item))
                                
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
                                        Text(item.nombre)
                                            .font(.title2)
                                        Text(formatDate(date: item.fecha))
                                            .font(.title2)
                                        if let doctor = item.doctor {
                                            Text(doctor)
                                                .font(.title2)
                                        }
                                        
                                    }.padding(15)
                                    
                                    Spacer()
                                    
                                    Button(action:{
                                    }){
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.blue)
                                            .padding(.leading, 60)
                                    }
                                    
                                    
                                }
                                
                            }
                        
                        
                        }
                        
                    }
                    .task {
                        await viewModel.getRecetas()
                    }
                    .frame(minHeight: minRowHeight * 12)
                        .scrollContentBackground(.hidden)
                        .listStyle(InsetListStyle())
                    
                
                }
            }
        }
    }
    
    
    func formatDate(date: String) -> String{
        return String(date.prefix(10))
    }
}

struct ListaRecetasView_Previews: PreviewProvider {
    static var previews: some View {
        ListaRecetasView()
    }
}
