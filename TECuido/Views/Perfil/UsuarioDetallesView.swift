//
//  UsuarioDetallesView.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//

import SwiftUI

 struct UsuarioDetallesView: View {
     @State private var isEditing = false
     @StateObject var viewModel = GetUsuarioDetallesViewModel()
     @Binding var path: NavigationPath
     @StateObject var viewModelContacto = EditarContactoEmergenciaViewModel()
     
     static var tag = "UsuarioDetallesView"
     
     var body: some View {
         ZStack{
             Color("BackgroundColor")
                 .ignoresSafeArea()
         ScrollView {
          
             VStack(alignment: .center) {
            
                 HStack {
                     // Espaciador a la izquierda para centrar el título
                     Spacer()

                     // Titulo centrado
                     Title(text: "Perfil de Usuario")
                         

                     // Espaciador a la derecha para centrar el título
                     Spacer()

                     Button(action: {
                        
                         isEditing.toggle()
                     }) {
                         Image(systemName: isEditing ? "pencil.circle.fill" : "pencil.circle")
                             .font(.title)
                             .foregroundColor(.blue)
                     }
                     .padding()
                 }
                 .padding()
                 if isEditing {
                    
                         if let usuario = viewModel.usuarioDetalles.first {
                             Group {

                             Input(inputText: $viewModel.usuarioDetalles[0].Usuario.nombre, inputPrompt: "Nombre del paciente", icon: "person.crop.circle.fill", iconSize: (25, 25), iconPadding: 10).overlay {
                                 RoundedRectangle(cornerRadius: 20)
                                     .stroke(.red, lineWidth: CGFloat(viewModel.nombreError) * 2)
                             }

                             Input(inputText: $viewModel.usuarioDetalles[0].numPoliza , inputPrompt: "Número de poliza", icon: "number", iconSize: (25, 25), iconPadding: 10)
                             Input(inputText: $viewModel.usuarioDetalles[0].edad, inputPrompt: "Edad", icon: "calendar", iconSize: (25, 25), iconPadding: 10)
                             Input(inputText: $viewModel.usuarioDetalles[0].direccion, inputPrompt: "Dirección", icon: "location.fill", iconSize: (25, 25), iconPadding: 10)
                           
                             Input(inputText: $viewModel.usuarioDetalles[0].medicoTratante, inputPrompt: "Médico tratante", icon: "person.badge.plus", iconSize: (25, 25), iconPadding: 10)
                             Input(inputText: $viewModel.usuarioDetalles[0].tipoSangre, inputPrompt: "Tipo de Sangre", icon: "drop.fill", iconSize: (25, 25), iconPadding: 10)
                             Input(inputText: $viewModel.usuarioDetalles[0].donacionOrganos, inputPrompt: "Donar órganos (SI/NO)", icon: "heart.text.square.fill", iconSize: (25, 25), iconPadding: 10)
                             Input(inputText: $viewModel.usuarioDetalles[0].transfusionSanguinea, inputPrompt: "Donar Sangre (SI/NO)", icon: "drop.fill", iconSize: (25, 25), iconPadding: 10)
                             }
                             //Selección de editar contactos
                             BigText(text: "Selecciona el nuevo contacto")

                             let contactoEmergenciaNombre = viewModel.usuarioDetalles[0].contactoEmergencia.nombre

                             SelectInput(
                              title: "Selecciona un contacto",
                              selectedOption: $viewModelContacto.selectedOptionContacto,
                              list: Array(Set(viewModelContacto.contactosNombres))
                             ) {
                              Task {
                              // Use the local variable instead of accessing the property directly
                              await viewModelContacto.getContactos(contacto: contactoEmergenciaNombre)
                              }
                             }

                             
                             PrimaryButton(title: "Editar"){
                                 Task {
                                     await viewModel.updateUsuarioDetalles(numPoliza: usuario.numPoliza, tipoSangre: usuario.tipoSangre, contactoEmergencia: viewModelContacto.selectedOptionContacto, transfusionSanguinea: usuario.transfusionSanguinea, donacionOrganos: usuario.donacionOrganos, direccion: usuario.direccion, edad: usuario.edad, medicoTratante: usuario.medicoTratante, nombre: usuario.Usuario.nombre)
                                     await viewModel.getUsuarioDetalles()
                                 }
                             }
                            
// Modal
                             .alert(isPresented: $viewModel.addedContacto) {
                                 AcceptAlert(
                                     title: "Confirmación",
                                     message:"Se ha editado el perfil médico con éxito"
                                 ) {
                                     
                                     isEditing = false
                                 }
                             }
                           

                            } else {
                                ErrorMessage(errorText: "No se encontraron detalles del usuario.")
                            }
                    
                 }else{
                 // Inicio pantalla normal
                     if let usuario = viewModel.usuarioDetalles.first {
                         
                         InfoRow(titulo: "Nombre del paciente", respuesta: usuario.Usuario.nombre)
                         InfoRow(titulo: "Numero de poliza", respuesta: usuario.numPoliza)
                         InfoRow(titulo: "Edad", respuesta: usuario.edad)
                         InfoRow(titulo: "Dirección", respuesta: usuario.direccion)

                         let infoContacto = " \(usuario.contactoEmergencia.nombre)  \( usuario.contactoEmergencia.correo.map { "\n\($0)" } ?? "")  \(usuario.contactoEmergencia.telefono.map { "\n\($0)" } ?? "")"
                         InfoRow(titulo: "Contacto de Emergencia", respuesta: infoContacto)

                         InfoRow(titulo: "Medico tratante", respuesta: usuario.medicoTratante)
                         InfoRow(titulo: "Tipo de Sangre", respuesta: usuario.tipoSangre)
                         InfoRow(titulo: "Donacion de Organos", respuesta: usuario.donacionOrganos)
                         InfoRow(titulo: "Donacion de Sangre", respuesta: usuario.transfusionSanguinea)
                                         } else {
                                             ErrorMessage(errorText: "No se encontraron detalles del usuario.")
                                         }
                     // Botón para ir a Datos Medicos
                     PrimaryButton(title: "Datos médicos"){
                         Task {
                                 path.append(DatosMedicosView.tag)
                         }
                     }
                     .padding(.top, 10)
                     
                     // Botón para enviar Datos Medicos al contacto de emergencia
                     SecondaryButton(title: "Enviar a contacto de emergencia"){
                         Task {
                             await viewModel.enviarCorreo()
                         }
                     }
                     
                 }
                   
                
                 }// Fin pantalla normal
             }
             .onAppear {
                 // Llamada a la función getUsuarioDetalles al aparecer la vista
                 Task {
                     await viewModel.getUsuarioDetalles()
                 }
             }
             .alert(isPresented: $viewModel.correoEnviado) {
                 AcceptAlert(
                     title: "Correo enviado",
                     message: "Se ha enviado un correo a tu contacto de emergencia con los datos de tu perfil médico"
                 ){
                     path.removeLast()
                 }
             }
                         
         }
     }
       
 }

 
 

 struct UsuarioDetallesView_Previews: PreviewProvider {
     static var previews: some View {
         UsuarioDetallesView(path: .constant(NavigationPath()))
     }
 }
