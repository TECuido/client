//
//  MandarEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI

struct MandarEmergenciaView: View {
    
    @State private var otro = ""
    
    @StateObject private var viewModel = MandarEmergenciaViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                Text("Emergencias")
                    .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .font(.system(size: 45))
                    .bold()
                    .padding()
                
                // Selección de motivo
                Text("Selecciona el motivo de la alerta")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                Picker("Selecciona un motivo", selection: $viewModel.selectedMotivo){
                    ForEach(viewModel.motivos, id: \.self) { option in
                        Text(option)
                            .font(.title)
                    }
                }
                .pickerStyle(DefaultPickerStyle())
                .frame(width: 325, height: 65)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(red: 0.1294, green: 0.5882, blue: 0.9529),   lineWidth: 4)
                )
                .cornerRadius(25)
                .padding(10)
                
                
                //Selección de contactos
                Text("Selecciona los contactos a los que les vas a avisar")
                    .font(.title2)
                    .frame(width:340)
                    .multilineTextAlignment(.center)
                // Picker de grupos
                // Seleccionador
                Picker("Selecciona un contacto", selection: $viewModel.selectedOptionContacto){
                    ForEach(viewModel.gruposNombres, id: \.self) { grupo in
                        Text(grupo)
                            .font(.title)
                    }
                }
                .task {
                    await viewModel.getGrupos()
                }
                .pickerStyle(DefaultPickerStyle())
                .frame(width: 325, height: 65)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(red: 0.1294, green: 0.5882, blue: 0.9529),   lineWidth: 4)
                )
                .cornerRadius(25)
                
                /*
                if viewModel.selectedOptionContacto == "Otro"{
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
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
                 */
                
                //descripcion
                VStack {
                    // Opción para elegir entre nivel de gravedad y texto descriptivo
                    Picker("Selecciona una opción", selection: $viewModel.isNivelGravedadSelected) {
                        Text("Nivel de gravedad").tag(true).font(.title2)
                        Text("Descripción").tag(false).font(.title2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(10)
                    
                    // Mostrar el campo de nivel de gravedad si se selecciona
                    if viewModel.isNivelGravedadSelected {
                        
                        Picker("Selecciona el nivel de gravedad", selection: $viewModel.nivel) {
                            ForEach(1 ..< 11, id: \.self) { level in
                                Text("\(level)")
                                    .font(.title)
                            }
                        }
                        .pickerStyle(DefaultPickerStyle())
                        .frame(width: 325, height: 65)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 0.1294, green: 0.5882, blue: 0.9529), lineWidth: 4)
                        )
                        .cornerRadius(25)
                        
                    
                    } else {
                        
                        VStack {
                            PlaceholderTextEditor(text: $viewModel.descripcion, placeholder: "Escribe aquí la descripción")
                                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                .font(.body)
                                .frame(width: 325, height: 100)
                                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                .cornerRadius(20)
                        }
                        
                        .frame(width: 325, height: 100)
                        
                        
                        
                        
                    }
                    
                    // Inicio boton
                        Button("Continuar") {
                            Task {
                                await viewModel.addEmergencia()
                            }
                        }
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 300, height: 65)
                        .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .cornerRadius(25)
                        .padding(30)
                        .font(.title2)
                }
                
            }
            NavigationLink("", destination: EstatusEmergenciaView(dataEmergencia: viewModel.dataEmergencia), isActive: $viewModel.showEstatusView)
                                    
                }
         
            }
    }

struct PlaceholderTextEditor: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .opacity(1)
                .scrollContentBackground(.hidden)
                .padding(.top, 10)
                .padding(.leading, 10)
                .lineSpacing(0.8)
            if text.isEmpty {
                Text(placeholder)
                    .opacity(0.75)
                    .padding(.top, 15)
                    .padding(.leading, 10)
                    .padding(.horizontal, 4)
                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))

            }
        }
    }
}




struct MandarEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        MandarEmergenciaView()
    }
}
