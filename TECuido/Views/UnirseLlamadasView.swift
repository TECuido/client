//
//  UnirseLlamadasView.swift
//  TECuido
//
//  Created by Alumno on 02/11/23.
//
import SwiftUI

struct UnirseLlamadasView: View {
    @State private var codigo = ""
    @State private var isCodigoEmpty = false
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
                                  text: $codigo,
                                  prompt: Text("Codigo")
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
                            .stroke(isCodigoEmpty ? .red : Color.clear)
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
                Button("Agregar"){
                    if codigo.isEmpty{
                        isCodigoEmpty = true
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
struct UnirseLlamadasView_Previews: PreviewProvider {
    static var previews: some View {
        UnirseLlamadasView()
    }
}

