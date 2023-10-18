//
//  MandarEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI

struct MandarEmergenciaView: View {
    @State private var showEstatusView = false
    @State private var selectedOption = "Médica"
    let options = ["Médica", "Desastre natural","Incendio","Accidente de tráfico","Acoso","Secuestro", "Extorsión","Emergencia tecnológica"]
    
    @State private var selectedOptionContacto = "Familiares"
    let optionsContacto = ["Familiares", "Mejores amigos", "Amigos", "Conocidos", "Otro"]
    @State private var otro = ""
    @State private var descripcion = ""
    var body: some View {
        ZStack{
                VStack{
                    ScrollView{
                        Text("Emergencias")
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            .font(.system(size: 45))
                            .bold()
                        // Imagen principal
                        Image("bienmini")
                        // Texto de todo bien
                        Text("Selecciona el motivo de ")
                            .font(.title)
                            .bold()
                        Text("la alerta")
                            .font(.title)
                            .bold()
                        // Seleccionador
                        Picker("Selecciona un motivo", selection: $selectedOption){
                            ForEach(options, id: \.self) { option in
                                Text(option)
                                    .font(.title)
                            }
                        }
                        .pickerStyle(DefaultPickerStyle())
                        .frame(width: 300, height: 65)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 0.1294, green: 0.5882, blue: 0.9529),   lineWidth: 4)
                                        )
                        .cornerRadius(25)
                        .padding(10)
                        
                        Text("Selecciona los contactos a los que les vas a avisar")
                            .font(.title)
                            .bold()
                            .frame(width:340)
                        // Picker de grupos
                        // Seleccionador
                        Picker("Selecciona un contacto", selection: $selectedOptionContacto){
                            ForEach(optionsContacto, id: \.self) { option in
                                Text(option)
                                    .font(.title)
                            }
                        }
                        .pickerStyle(DefaultPickerStyle())
                        .frame(width: 300, height: 65)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 0.1294, green: 0.5882, blue: 0.9529),   lineWidth: 4)
                                        )
                        .cornerRadius(25)
                        // Caso Otro
                        if selectedOptionContacto == "Otro"{
                            HStack {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 30, height: 20)
                                    .padding(.leading, 15)
                                TextField("",
                                          text: $otro,
                                          prompt: Text("Contacto o grupo")
                                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                )
                                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                .font(.title3)
                                .padding(.leading, 10)
                            }.padding(10) .frame(width: 300, height: 85)
                        }
                        //descripcion
                        Text("Describe la emergencia")
                            .font(.title)
                            .bold()
                        // Agregar select de motivo de alerta
                        VStack {
                            PlaceholderTextEditor(text: $descripcion, placeholder: "Escribe aquí la descripción")

                                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                .font(.title2)
                                .frame(width: 300, height: 200)
                            
                            Spacer()
                        }
                        .frame(width: 300, height: 200)
                       
                    }.frame(height: 450)
                    // Inicio boton
                        Button("Continuar") {
                                        showEstatusView = true
                                    }
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(width: 300, height: 65)
                                    .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                    .cornerRadius(25)
                                    .padding(30)
                                    .font(.title)

                    Rectangle()
                        .foregroundColor((Color(red: 0.1294,green: 0.5882,blue: 0.9529)))
                        .ignoresSafeArea()
                                    
                }
                .background(
                            NavigationLink("", destination: EstatusEmergenciaView(), isActive: $showEstatusView)
                        )

                
            }
    }
}

struct PlaceholderTextEditor: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .opacity(text.isEmpty ? 0.25 : 1)
            if text.isEmpty {
                Text(placeholder)
                    .opacity(0.75)
                    .padding(.top, 8)
                    .padding(.horizontal, 4)
            }
        }
    }
}




struct MandarEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        MandarEmergenciaView()
    }
}
