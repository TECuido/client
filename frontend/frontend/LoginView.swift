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
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.8)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.45)
                    .foregroundColor(.white)
                // Texto general
                VStack{
                    Text("Iniciar Sesión")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    //Inputs
                    TextField("Correo", text: $email).padding()
                        .frame(width: 300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongEmail))
                    
                    SecureField("Contraseña", text: $password).padding()
                        .frame(width: 300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongPassword))
                    //Boton
                    Button("Iniciar Sesión"){
                     authenticateEmail(email: email, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height:50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
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
                wrongPassword = 2
            }
        }else{
            wrongEmail = 2
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
