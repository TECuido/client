//
//  LoginView.swift
//  frontend
//
//  Created by Erick on 11/10/23.
//

import SwiftUI

struct RegisterView: View {
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
                    //Inputs
                    
                    TextField("Correo", text: $email).padding(50)
                        .overlay(
                            HStack{
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(.black)
                                    .padding(.leading,10)
                                Spacer()

                            }
                                                        
                        )
                        .frame(width: 300, height:50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .padding(30)
                        .border(.red,width: CGFloat(wrongEmail))
                        .font(.title2)
                       
                    SecureField("Contraseña", text: $password).padding(40)
                        .overlay(
                            HStack{
                                Image(systemName: "lock.fill")
                                    .foregroundColor(.black)
                                    .padding(.leading,10)
                                Spacer()

                            }
                                                        
                        )
                        .frame(width: 300, height:50)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongPassword))
                        .font(.title2)
                        .foregroundColor(.black)
                        
                    
                    HStack{
                        
                        Circle()
                            .frame(width: 20)
                            .foregroundColor(Color.black.opacity(0.06))
                        Text("Recordar").padding(5)
                            .foregroundColor(Color(red: 0.6824,green: 0.6824,blue: 0.6824))
                    
                        Text("¿Olvidaste tu contraseña?").foregroundColor(Color(red: 0.6824,green: 0.6824,blue: 0.6824))
                        
                    }
                    //Boton
                    Button("Iniciar Sesión"){
                        authenticateEmail(email: email, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height:55)
                    .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .cornerRadius(20)
                    .padding(30)
                    .font(.title)
                    
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
    
    struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }
}
