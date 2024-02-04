//
//  EditarContactosView.swift
//  TECuido
//
//  Created by Alumno on 03/02/24.
//

import SwiftUI


struct EditarContactosView: View {
    @EnvironmentObject var session: SessionManager
       @Environment(\.presentationMode) var presentationMode
       @StateObject var viewModel = ContactoViewModel()

       @Binding var path: NavigationPath
    
    @StateObject var viewModel2 = EditContactViewModel()
   
       var  contacto: ContactoModel
       static var tag = "EditarContactos"
    
    init(path: Binding<NavigationPath>, contacto: ContactoModel){
        self._path = path
        self.contacto = contacto
    
    }
    
    var body: some View {
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{

                Title(text: "Editar a un contacto")

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
                    .onAppear {
                        viewModel.nombre = contacto.nombre
                    }

                Input(inputText: $viewModel.telefono,
                      inputPrompt: "Número de teléfono",
                      icon: "phone.fill",
                      iconSize: (25, 25),
                      iconPadding: 15,
                      inputError: viewModel.telefonoError)
                    .onAppear {
                        viewModel.telefono = contacto.telefono
                    }

                Input(inputText: $viewModel.correo,
                      inputPrompt: "Correo (opcional)",
                      icon: "envelope.fill",
                      iconSize: (30, 20),
                      iconPadding: 12,
                      inputError: viewModel.correoError)
                    .onAppear {
                        viewModel.correo = contacto.correo ?? ""
                    }

                
                ErrorMessage(errorText: viewModel.error)
                    .padding(.bottom, -10)
                
                PrimaryButton(title: "Enviar"){
                    Task {
                        await viewModel2.updateContact(idContacto:contacto.id,nombre:viewModel.nombre,correo:viewModel.correo,telefono:viewModel.telefono)
                    }
                }
                // Modal
                .alert(isPresented: $viewModel2.perfilEditado) {
                    AcceptAlert(
                        title: "Contacto Editado",
                        message:  "Se agregó el contacto con éxito"
                    ){
                        viewModel.correo = ""
                        path.removeLast()
                    }
                }
                
            }
            
            
            
        }
    }
    
               

}

struct EditarContactosView_Previews: PreviewProvider {
    static var previews: some View {
        EditarContactosView(
            path: .constant(NavigationPath()),
            contacto: ContactoModel.defaultContacto
        )
    }
}
