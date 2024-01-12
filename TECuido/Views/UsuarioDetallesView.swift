//
//  UsuarioDetallesView.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//

import SwiftUI

 struct UsuarioDetallesView: View {
     @State private var isEditing = false
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
                         // Aquí puedes agregar la lógica para activar el modo de edición
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
                     InfoRow(titulo: "Nombre del paciente", respuesta: "Alejandro Esparza")
                     InfoRow(titulo: "Numero de poliza", respuesta: "12343")
                     InfoRow(titulo: "Edad", respuesta: "21 años")
                     InfoRow(titulo: "Direccion", respuesta: "Calle Floresta, Colonia Altavista C.P. 22322")
                     InfoRow(titulo: "Contacto de Emergencia", respuesta: "Carlos Rodriguez\ncarlosr@gmail.com")
                     InfoRow(titulo: "Medico tratante", respuesta: "Kraken Cordova")
                     InfoRow(titulo: "Tipo de Sangre", respuesta: "O+")
                     InfoRow(titulo: "Donacion de Organos", respuesta: "Si")
                     InfoRow(titulo: "Donacion de Sangre", respuesta: "Si")
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

 struct UsuarioDetallesView_Previews: PreviewProvider {
     static var previews: some View {
         UsuarioDetallesView()
     }
 }
