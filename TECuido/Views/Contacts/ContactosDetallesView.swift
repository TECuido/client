//
//  ContactosDetallesView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI

struct ContactosDetallesView: View {
    
    @EnvironmentObject var session: SessionManager
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = ContactoViewModel()
    
    @Binding var path: NavigationPath
    
    static var tag = "ContactosDetalles"
    
    var body: some View {
        
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{

                Title(text: session.tipoUsuario == 2 ? "Agrega a un paciente" : "Agrega a un contacto")

                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 140,height: 140)
                    .foregroundColor(Color("LightBlue"))
                    .padding(.top, 20)
                
                //Input Correo
                Input(inputText: $viewModel.correo,
                      inputPrompt: "Correo electrónico",
                      icon: "envelope.fill",
                      iconSize: (30, 20),
                      iconPadding: 15,
                      inputError: viewModel.correoError)
                .padding(.top, 20)
                
                ErrorMessage(errorText: viewModel.error)
                    .padding(.bottom, -10)
                
                PrimaryButton(title: "Enviar"){
                    Task {
                        await viewModel.addContacto()
                    }
                }
                
            }
            
            // Modal
            .alert(isPresented: $viewModel.addedContacto) {
                AcceptAlert(
                    title: session.tipoUsuario == 2 ? "Paciente Agregado" : "Contacto Agregado",
                    message: session.tipoUsuario == 2 ? "Se agregó al paciente con éxito" : "Se agregó el contacto con éxito"
                ){
                    viewModel.correo = ""
                    path.removeLast()
                }
            }
            
        }
    }
    
               

}

struct ContactosDetallesView_Previews: PreviewProvider {
    static var previews: some View {
        ContactosDetallesView(path: .constant(NavigationPath()))
            .environmentObject(SessionManager())
    }
}
