//
//  GruposDetalleView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI

struct GruposDetallesView: View {
    @StateObject var viewModel = ContactoViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @State private var showDetallesView = false
   
    
    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    // Titulo
                    Text("Nombre del Grupo")
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
                                    Text(item.correo ?? "pan@gmail.con")
                                        .font(.title2)
                                }.padding(15)
                            }
                            
                            
                        }
                        
                    }.frame(minHeight: minRowHeight * 12)
                        .scrollContentBackground(.hidden)
                        .listStyle(InsetListStyle())
                    
                    //El boton de agregar
                    NavigationLink("", destination: ContactosDetallesView(), isActive: $showDetallesView)
                }
            }
        }
    }
}
    
struct GruposDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        GruposDetallesView()
    }
}
