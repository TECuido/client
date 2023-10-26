//
//  ContactosDetallesView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI

struct ContactosDetallesView: View {
    @Environment(\.presentationMode) var presentationMode
    
    
    @StateObject var viewModel = ContactoViewModel()
    
    
    
    var body: some View {
        
        ZStack{
            VStack{
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
                
                //Input Correo
                HStack {
                    Image(systemName: "envelope.fill")
                        .resizable()
                        .frame(width: 30, height: 20)
                        .padding(.leading, 15)
                    TextField("",
                              text: $viewModel.correo,
                              prompt: Text("Correo electrónico")
                        .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                      )
                        .font(.title3)
                        .padding(.leading, 5)
                        .autocapitalization(.none)
                }
                .frame(width: 325, height: 55)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.red, lineWidth: CGFloat(viewModel.correoError)*2)
                }
                .padding([.top, .bottom], 10)
                
                
                // Aqui validamos que este incorrecto
                Text(viewModel.error)
                    .font(.body)
                    .foregroundColor(Color(red: 0.8392,green: 0,blue: 0))
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .padding()
                
                
                Button("Enviar"){
                    //presentationMode.wrappedValue.dismiss()
                    Task {
                        await viewModel.addContacto()
                    }
                }
                .foregroundColor(.white)
                .bold()
                .frame(width: 300, height:55)
                .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                .cornerRadius(25)
                .padding(10)
                .font(.title2)
                }
            
            
            // Modal
            .alert(isPresented: $viewModel.addedContacto) {
                Alert(
                    title:
                        Text("Contacto Agregado")
                           
                            .font(.title)
                    ,
                    message: Text("Se agregó el contacto con éxito")
                        .font(.title2),
                    dismissButton: .default(
                        Text("OK")
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529)),
                        action: {
                            viewModel.correo = ""
                        }
                    )
                )
            }
            
        }
    }
}

struct ContactosDetallesView_Previews: PreviewProvider {
    static var previews: some View {
        ContactosDetallesView()
    }
}
