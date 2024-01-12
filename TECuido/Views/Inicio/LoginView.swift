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
                    Text("Iniciar Sesión")
                        .foregroundColor(Color("TitleColor"))
                        .font(.custom("Inter", size: FontSize.title.rawValue))
                        .bold()
                        .padding(10)
                                        
                    //Input Correo
                    Input(inputText: $viewModel.correo,
                          inputPrompt: "Correo electrónico",
                          icon: "envelope.fill", 
                          inputError: viewModel.correoError)
                    .padding(.top, 40)
                    
                    PasswordInput(inputText: $viewModel.password,
                                  inputPrompt: "Contraseña",
                                  inputError: viewModel.passwordError)
                    .padding(.top, 20)
                    
                    
                    // Aqui validamos que este incorrecto
                    Text(viewModel.message)
                        .font(.body)
                        .foregroundColor(Color(red: 0.8392,green: 0,blue: 0))
                        .frame(width: 300)
                        .padding(.top, 5)
                        .multilineTextAlignment(.center)
                    
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
