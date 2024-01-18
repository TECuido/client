//
//  ContactoEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 16/01/24.
//

import SwiftUI

struct ContactoEmergenciaView: View {

 
    @StateObject var viewModel = ContactoEmergenciaViewModel()
    
    @Binding var path: NavigationPath
    
    static var tag = "ContactosEmergencia"
    
    var body: some View {
        
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{

                TitleLarge(text:  "Añade un contacto de emergencia")
           

                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 140,height: 140)
                    .foregroundColor(Color("LightBlue"))
                    .padding(.top, 20)
                
                Input(inputText: $viewModel.nombre,
                      inputPrompt: "Nombre del contacto",
                      icon: "person.fill",
                      iconSize: (24, 24),
                      iconPadding: 20,
                      inputError: viewModel.nombreError)
                .padding(.top, 20)
                
                Input(inputText: $viewModel.telefono,
                      inputPrompt: "Número de teléfono",
                      icon: "phone.fill",
                      iconSize: (25, 25),
                      iconPadding: 15,
                      inputError: viewModel.telefonoError)
                
                Input(inputText: $viewModel.correo,
                      inputPrompt: "Correo (opcional)",
                      icon: "envelope.fill",
                      iconSize: (30, 20),
                      iconPadding: 12,
                      inputError: viewModel.correoError)
                
                ErrorMessage(errorText: viewModel.error)
                    .padding(.bottom, -10)
                
                PrimaryButton(title: "Enviar"){
                    Task {
                        await viewModel.addContactoEmergencia()
                    }
                   
                }
                
            }
            
            // Modal
            .alert(isPresented: $viewModel.addedContacto) {
                AcceptAlert(
                    title:  "Contacto de Emergencia Agregado",
                    message: "Se agregó el contacto de emergencia con éxito"
                ){
                    viewModel.correo = ""
                        
                        path.append(HomeView.tag)
                    
                }
            }
            
        }
    }
    
               

}
struct ContactoEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        ContactoEmergenciaView(path: .constant(NavigationPath()))
    }
}
