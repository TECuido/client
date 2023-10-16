//
//  TECuidoView.swift
//  frontend
//
//  Created by Erick on 12/10/23.
//

import SwiftUI

struct TECuidoView: View {
    @State private var showLoginView = false
    @State private var showRegisterView = false
    
    var body: some View {
        NavigationView{
            ZStack{
                
                Color(red: 0.1294, green: 0.5882, blue: 0.9529)
                    .ignoresSafeArea()
                // Texto general
                VStack{
                    VStack{
                        Text("TECuido")
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            .font(.largeTitle)
                            .bold()
                            .padding(20)
                        Text("Salud sin barreras")
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            .font(.largeTitle)
                            .bold()
                            .padding(20)
                        
                        
                        
                        // Boton Iniciar Sesion
                        Button("Iniciar Sesión"){
                            showLoginView = true
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height:55)
                        .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(30)
                        .font(.title)
                        
                        NavigationLink(destination: LoginView(), isActive: $showLoginView) {
                            EmptyView()
                        }
                        
                        // Boton Registrarse
                        Button("Regístrate"){
                            showRegisterView = true
                        }
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .frame(width: 300, height:55)
                        .background(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(30)
                        .font(.title)
                        
                        NavigationLink(destination: RegisterView(), isActive: $showRegisterView) {
                            EmptyView()
                        }
                    }
                    
                }
                .frame(width: 500, height: 700)
                .background(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                
                
            }
        }
        
        .navigationBarHidden(true)
        
        
        
    }
    

    struct TECuidoView_Previews: PreviewProvider {
        static var previews: some View {
            TECuidoView()
        }
    }
}
