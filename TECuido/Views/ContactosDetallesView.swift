//
//  ContactosDetallesView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI

struct ContactosDetallesView: View {
    @State private var correo = ""
    @State private var isCorreoEmpty = false
    @State private var isShowingConfirmationModel = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {

        ZStack{
            VStack{
                ScrollView{
                    // Titulo
                    Text("Unirse a una llamada")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                    //Input Nombre
                    ZStack{
                        Image(systemName: "phone.circle.fill")
                            .resizable()
                            .frame(width: 140,height: 140)
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            
                    }.padding(40)
                   
                    
                    //Input Correo
                    HStack {
                        Image(systemName: "number")
                            .resizable()
                            .frame(width: 30, height: 20)
                            .padding(.leading, 15)
                        TextField("",
                                  text: $correo,
                                  prompt: Text("Código")
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
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(isCorreoEmpty ? .red : Color.clear)
                    }
                    .padding([.top, .bottom], 10)
                }
                
                // Modal
                .alert(isPresented: $isShowingConfirmationModel) {
                    Alert(
                        title:
                            Text("Iniciando llamada")
                               
                                .font(.title)
                        ,
                        message: Text("Te has unido a una llamada")
                            .font(.title2),
                        dismissButton: .default(
                            Text("OK")
                                .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529)),
                            action: {
                                presentationMode.wrappedValue.dismiss()
                            }
                        )
                    )
                }

                // Vamos a checar lo del modal aqui
                Button("Unirse llamada"){
                    if correo.isEmpty{
                        isCorreoEmpty = true
                    }
                    else{
                        isShowingConfirmationModel = true
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
            
        }
    }
    
}
struct ContactosDetallesView_Previews: PreviewProvider {
    static var previews: some View {
        ContactosDetallesView()
    }
}
