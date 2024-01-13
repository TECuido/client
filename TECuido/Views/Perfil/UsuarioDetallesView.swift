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
     var body: some View {
         ScrollView {
             VStack(alignment: .leading, spacing: 10) {
                 HStack {
                     // Espaciador a la izquierda para centrar el título
                     Spacer()

                     // Titulo centrado
                     Text("Perfil de Usuario")
                         .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                         .font(.system(size: 45))
                         .bold()
                         .multilineTextAlignment(.center)

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

                 VStack(alignment: .leading, spacing: 15) {
                     if let usuario = viewModel.usuarioDetalles.first {
                                             InfoRow(titulo: "Nombre del paciente", respuesta: usuario.Usuario.nombre)
                                             InfoRow(titulo: "Numero de poliza", respuesta: usuario.numPoliza ?? "")
                                             InfoRow(titulo: "Edad", respuesta: usuario.edad )
                                             InfoRow(titulo: "Direccion", respuesta: usuario.direccion )
                                             InfoRow(titulo: "Contacto de Emergencia", respuesta: "\(usuario.contactoEmergencia.nombre)\n\(usuario.contactoEmergencia.correo)")
                                             InfoRow(titulo: "Medico tratante", respuesta: usuario.medicoTratante )
                                             InfoRow(titulo: "Tipo de Sangre", respuesta: usuario.tipoSangre)
                                             InfoRow(titulo: "Donacion de Organos", respuesta: usuario.donacionOrganos)
                                             InfoRow(titulo: "Donacion de Sangre", respuesta: usuario.transfusionSanguinea)
                                         } else {
                                             Text("No se encontraron detalles del usuario.")
                                                 .foregroundColor(.red)
                                         }
                 }
                 .padding()



                 // Botón para ir a Datos Medicos
                 NavigationLink(destination: DatosMedicosView()) {
                     Text("Ir a Datos Medicos")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 300, height: 55)
                         .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                         .cornerRadius(25)
                         .padding(10)
                         .font(.title2)
                 }
             }
             .background(Color.white)
             .cornerRadius(10)
             .shadow(radius: 5)
             .padding()
         }
         // Llamada a la función getUsuarioDetalles al aparecer la vista
                         .onAppear {
                             Task {
                                 await viewModel.getUsuarioDetalles()
                             }

     }
 }

 struct InfoRow: View {
     var titulo: String
     var respuesta: String
     var body: some View {
         VStack(alignment: .leading, spacing: 5) {
             Text(titulo)
                 .font(.title2)
                 .foregroundColor(.gray)
                 .lineLimit(nil)
             Text(respuesta)
                 .font(.title)

                 .multilineTextAlignment(.leading)
                 .lineLimit(nil)
             Divider().background(Color.gray.opacity(0.2)) // Divider gris
         }
     }
 }
 }

 struct UsuarioDetallesView_Previews: PreviewProvider {
     static var previews: some View {
         UsuarioDetallesView()
     }
 }
