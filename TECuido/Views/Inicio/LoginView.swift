//
//  LoginView.swift
//  frontend
//
//  Created by Bernardo on 11/10/23.
//
import SwiftUI
struct LoginView: View {
    
    @EnvironmentObject var session: SessionManager
    @StateObject var viewModel = UsuarioViewModel()
    @Binding var path: NavigationPath
    
    static var tag = "Login"
    
    var body: some View {
            ZStack{
               
                Color("BackgroundColor")
                
                // Texto general
                VStack{
                    Title(text:"Iniciar sesión")
                                        
                    //Input Correo
                    Input(inputText: $viewModel.correo,
                          inputPrompt: "Correo electrónico",
                          icon: "envelope.fill", 
                          iconSize: (30, 20),
                          iconPadding: 15,
                          inputError: viewModel.correoError)
                    .padding(.top, 40)
                    
                    //Input contraseña
                    PasswordInput(inputText: $viewModel.password,
                                  inputPrompt: "Contraseña",
                                  inputError: viewModel.passwordError)
                    .padding(.top, 20)
                    
                    
                    // Se muestra un mensaje si es incorrecto
                    ErrorMessage(errorText: viewModel.message)
                        .padding(.bottom, -10)
                    
                    //Boton
                    PrimaryButton(title: "Iniciar sesión"){
                        Task {
                            await viewModel.login()
                            session.tipoUsuario = viewModel.tipoUsuario
                            if(viewModel.isAuthenticated){
                                path.append(HomeView.tag)
                            }
                        }
                    }
                    .padding(.top, 10)
                    
                }
                
            }
        
        
    }
    
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(path: .constant(NavigationPath()))
    }
}
