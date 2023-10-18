//
//  RegistroView.swift
//  frontend
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI

struct RegistroView: View {
    
    @StateObject var viewModel = RegistroViewModel()
    
    var body: some View {
        
            NavigationView{
                ZStack{
                    //Diseño
                    Color(red: 0.1294,green: 0.5882,blue: 0.9529)
                        .ignoresSafeArea()
                    Circle()
                        .scale(2)
                        .foregroundColor(.white.opacity(0.15))
                    Circle()
                        .scale(1.75)
                        .foregroundColor(.white)
                    
                    // Texto general
                    VStack{
                        Text("Registro")
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            .font(.largeTitle)
                            .bold()
                            .padding(20)
                        
                        //Input Nombre
                        HStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(.leading, 16)
                            TextField("",
                                      text: $viewModel.nombre,
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
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.red, lineWidth: CGFloat(viewModel.nombreError)*2)
                        }
                        .padding([.top, .bottom], 10)
                        
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
                                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                .font(.title3)
                                .padding(.leading, 5)
                        }
                        .frame(width: 325, height: 55)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(20)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.red, lineWidth: CGFloat(viewModel.correoError)*2)
                        }
                        .padding([.top, .bottom], 10)
                        
                        
                        //Input Contraseña
                        HStack {
                            Image(systemName: "lock.fill")
                                .resizable()
                                .frame(width: 17, height: 25)
                                .padding(.leading, 20)
                            SecureField("",
                                      text: $viewModel.password,
                                      prompt: Text("Contraseña")
                                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                              )
                                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                .font(.title3)
                                .padding(.leading, 13)
                        }
                        .frame(width: 325, height: 55)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(20)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.red, lineWidth: CGFloat(viewModel.passwordError)*2)
                        }
                        .padding([.top, .bottom], 10)
                        
                        
                        //Input Confirmar contraseña
                        HStack {
                            Image(systemName: "lock.fill")
                                .resizable()
                                .frame(width: 17, height: 25)
                                .padding(.leading, 20)
                            SecureField("",
                                        text: $viewModel.confPassword,
                                        prompt: Text("Confirma tu contraseña")
                                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                              )
                                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                .font(.title3)
                                .padding(.leading, 13)
                        }
                        .frame(width: 325, height: 55)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(20)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.red, lineWidth: CGFloat(viewModel.confPassError)*2)
                        }
                        .padding([.top, .bottom], 10)
                    
            
                        // Aqui validamos que este incorrecto
                        Text(viewModel.message)
                            .font(.body)
                            .foregroundColor(Color(red: 0.8392,green: 0,blue: 0))
                            .frame(width: 300)
                            .padding(.top, 5)
                            .multilineTextAlignment(.center)
                        
                        //Boton
                        Button("Registrarme"){
                            Task {
                                await viewModel.register()
                            }
                        }
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 300, height:55)
                        .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .cornerRadius(25)
                        .padding(10)
                        .font(.title2)
                        
                        NavigationLink(destination: HomeView(),
                                       isActive: $viewModel.isAuthenticated){
                            EmptyView()
                        }
                        
                        
                    }
                    
                    
                }
            }
            .navigationBarHidden(true)
            
            
            
        }
    }

struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroView()
    }
}
