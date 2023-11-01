//
//  ListaContactosView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI



struct ListaContactosView: View {
    @StateObject var viewModel = ListaContactoViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @State private var showDetallesView = false
    
    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    // Titulo
                    Text("Lista de Contactos")
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
                                    Text(item.usuarioAgregado.nombre)
                                        .font(.title2)
                                    Text(item.usuarioAgregado.correo)
                                        .font(.title2)
                                }.padding(15)
                            }
                            
                            
                        }
                        
                    }
                    .task {
                        await viewModel.getContactos()
                    }
                    .frame(minHeight: minRowHeight * 10)
                        .scrollContentBackground(.hidden)
                        .listStyle(InsetListStyle())
                        
                    //El boton de agregar
                   
                    Button(action:{
                        showDetallesView = true
                    }){
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    }
                    .padding(.bottom,20)
                    .padding(.leading,240)
                    
              
                NavigationLink("", destination: ContactosDetallesView(), isActive: $showDetallesView)
                }
            }
        }
    }
    
    
    
}


struct ListaContactosView_Previews: PreviewProvider {
    static var previews: some View {
        ListaContactosView()
    }
}
