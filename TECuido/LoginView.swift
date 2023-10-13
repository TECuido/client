//
//  LoginView.swift
//  frontend
//
//  Created by Bernardo on 11/10/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    
    var body: some View {
        NavigationView{
            ZStack{
                //Diseño
                Color(red: 0.1294,green: 0.5882,blue: 0.9529)
                    .ignoresSafeArea()
                Circle()
                    .scale(1.8)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.5)
                    .foregroundColor(.white)
                
                // Texto general
                VStack{
                    Text("Iniciar Sesión")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.largeTitle)
                        .bold()
                        .padding(20)
                                        
                    //Input Correo
                    HStack {
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .frame(width: 30, height: 20)
                            .padding(.leading, 15)
                        TextField("",
                                  text: $email,
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
                            .stroke(.red, lineWidth: CGFloat(wrongEmail)*2)
                    }
                    .padding([.top, .bottom], 10)

                    //Input Contraseña
                    HStack {
                        Image(systemName: "lock.fill")
                            .resizable()
                            .frame(width: 17, height: 25)
                            .padding(.leading, 20)
                        SecureField("",
                                  text: $password,
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
                            .stroke(.red, lineWidth: CGFloat(wrongPassword)*2)
                    }
                    .padding([.top, .bottom], 10)
                        
                    
                    HStack{
                        
                        Circle()
                            .frame(width: 20)
                            .foregroundColor(Color.black.opacity(0.06))
                        Text("Recordar").padding(5)
                            .foregroundColor(Color(red: 0.6824,green: 0.6824,blue: 0.6824))
                    
                        Text("¿Olvidaste tu contraseña?").foregroundColor(Color(red: 0.6824,green: 0.6824,blue: 0.6824))
                        
                    }
                    
                    
                    //Boton
                    Button("Iniciar sesión"){
                        
                    }
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 300, height:55)
                    .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .cornerRadius(25)
                    .padding(30)
                    .font(.title2)
                    
                    NavigationLink(destination: Text("Iniciaste sesión @\(email)"),isActive: $showingLoginScreen){
                        EmptyView()
                    }
                }
                
                
            }
        }
        .navigationBarHidden(true)
        
        
        
    }
    // Funcion que valida que se pueda pasar al usuario
    func authenticateEmail(email: String, password: String){
        if(email.lowercased() == "bdelas@gmail.com"){
            wrongEmail = 0
            if(password.lowercased() == "papa"){
                wrongPassword = 0
                showingLoginScreen = true
            }else{
                wrongPassword =    1
            }
        }else{
            wrongEmail = 1
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
