//
//  RegistroView.swift
//  frontend
//
//  Created by Julio on 12/10/23.
//

import SwiftUI

struct RegistroView: View {
        
    @EnvironmentObject var session: SessionManager
    @StateObject var viewModel = RegistroViewModel()
    @Binding var path: NavigationPath
    
    var typeCuenta: TipoUsuario = .personaOyente
    
    static var tag = "Registro"
    
    var body: some View {
        
                ZStack{
                    Color("BackgroundColor")
                        .ignoresSafeArea()
                    
                    // Texto general
                    VStack{
                        Title(text:"Regístrate")
                            .padding(.bottom, 20)
                        
                        //Input Nombre
                        Input(inputText: $viewModel.nombre,
                              inputPrompt: "Nombre",
                              icon: "person.fill",
                              iconSize: (24, 24),
                              iconPadding: 20,
                              inputError: viewModel.nombreError)
                        
                        Input(inputText: $viewModel.correo,
                              inputPrompt: "Correo electrónico",
                              icon: "envelope.fill",
                              iconSize: (30, 20),
                              iconPadding: 15,
                              inputError: viewModel.correoError)
                        
                        Input(inputText: $viewModel.telefono,
                              inputPrompt: "Número de teléfono",
                              icon: "phone.fill",
                              iconSize: (25, 25),
                              iconPadding: 15,
                              inputError: viewModel.telefonoError)
                        
                        PasswordInput(
                            inputText: $viewModel.password,
                            inputPrompt: "Contraseña",
                            inputError: viewModel.passwordError)
                        
                        PasswordInput(
                            inputText: $viewModel.confPassword,
                            inputPrompt: "Confirma tu contraseña",
                            inputError: viewModel.confPassError)
                        
                        // Mostramos si hay un error
                        ErrorMessage(errorText: viewModel.message)
                            .padding(.bottom, -10)
                        
                        PrimaryButton(title: "Registrarme"){
                            Task {
                                await viewModel.register(idTipo: typeCuenta.rawValue)
                                if(viewModel.isAuthenticated){
                                    session.tipoUsuario = viewModel.tipoUsuario
                                    path.append(HomeView.tag)
                                }
                            }
                        }
                        
                        
                    }
                    
                    
                }
                
            }
            
    }

struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroView(path: .constant(NavigationPath()), typeCuenta: .personaSorda)
    }
}
