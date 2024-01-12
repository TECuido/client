//
//  RegistroView.swift
//  frontend
//
//  Created by Julio on 12/10/23.
//

import SwiftUI

struct RegistroView: View {
        
    @EnvironmentObject var session: SessionManager
    @Binding var typeCuenta: TipoUsuario?
    @StateObject var viewModel = RegistroViewModel()
    
    static var tag = "Registro"
    
    var body: some View {
        
                ZStack{
                    Color("BackgroundColor")
                    
                    // Texto general
                    VStack{
                        Title(text:"Regístrate")
                        
                        //Input Nombre
                        Input(inputText: $viewModel.nombre,
                              inputPrompt: "Nombre",
                              icon: "person.fill",
                              iconSize: (24, 24),
                              iconPadding: 16,
                              inputError: viewModel.nombreError)
                        
                        Input(inputText: $viewModel.correo,
                              inputPrompt: "Correo elctrónico",
                              icon: "envelope.fill",
                              iconSize: (30, 20),
                              iconPadding: 15,
                              inputError: viewModel.correoError)
                        
                        
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
                        
                        PrimaryButton(title: "Registrarme"){
                            Task {
                                await viewModel.register(idTipo: typeCuenta?.rawValue ?? 0)
                                session.tipoUsuario = viewModel.tipoUsuario
                            }
                        }
                        
                        
                    }
                    
                    
                }
            }
            
            
            
    }

struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroView(typeCuenta: .constant(.personaSorda))
    }
}
