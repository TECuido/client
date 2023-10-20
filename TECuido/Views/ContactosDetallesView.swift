//
//  ContactosDetallesView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI

struct ContactosDetallesView: View {
    @State private var nombre = ""
    @State private var correo = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        ZStack{
            VStack{
                ScrollView{
                    // Titulo
                    Text("Agrega a un contacto")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                    //Input Nombre
                    ZStack{
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 140,height: 140)
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            
                    }.padding(40)
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, 16)
                        TextField("",
                                  text: $nombre,
                                  prompt: Text("Nombre")
                            .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                          )
                            .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                            .font(.title3)
                            .padding(.leading, 10)
                    }
                    .frame(width: 325, height: 55)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(20)
                    .padding([.top, .bottom], 10)
                    
                    //Input Correo
                    HStack {
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .frame(width: 30, height: 20)
                            .padding(.leading, 15)
                        TextField("",
                                  text: $correo,
                                  prompt: Text("Correo electrónico")
                            .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                          )
                            .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                            .font(.title3)
                            .padding(.leading, 5)
                            .autocapitalization(.none)
                    }
                    .frame(width: 325, height: 55)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(20)
                    
                    .padding([.top, .bottom], 10)
                }
                
                Button("Enviar"){
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
                .bold()
                .frame(width: 300, height:55)
                .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                .cornerRadius(25)
                .padding(10)
                .font(.title2)
            }
            
        }
    }
}

struct ContactosDetallesView_Previews: PreviewProvider {
    static var previews: some View {
        ContactosDetallesView()
    }
}
