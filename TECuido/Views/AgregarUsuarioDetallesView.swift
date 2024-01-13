//
//  AgregarUsuarioDetallesView.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//
import SwiftUI
struct AgregarUsuarioDetallesView: View {
   
    @StateObject var viewModel = UsuarioDetallesViewModel()
    @State private var scale = 1.0
    @Binding var path: NavigationPath
    
    static var tag = "AgregarUsuarioDetalles"
        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Spacer()
                        Text("Datos de pérfil médico")
                            .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                            .font(.system(size: 45))
                            .bold()
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding()
                    VStack(alignment: .leading, spacing: 15) {
                    
                        Input(inputText: $viewModel.numPoliza, inputPrompt: "Número de poliza", icon: "number", iconSize: (25, 25), iconPadding: 10)
                        Input(inputText: $viewModel.edad, inputPrompt: "Edad", icon: "calendar", iconSize: (25, 25), iconPadding: 10)
                        Input(inputText: $viewModel.direccion, inputPrompt: "Dirección", icon: "location.fill", iconSize: (25, 25), iconPadding: 10)
                        Input(inputText: $viewModel.contactoEmergencia, inputPrompt: "Correo de Contacto", icon: "phone.circle.fill", iconSize: (25, 25), iconPadding: 10) .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.red, lineWidth: CGFloat(viewModel.contactoError)*2)
                        }
                        Input(inputText: $viewModel.medicoTratante, inputPrompt: "Médico tratante", icon: "person.badge.plus", iconSize: (25, 25), iconPadding: 10)
                        Input(inputText: $viewModel.tipoSangre, inputPrompt: "Tipo de Sangre", icon: "drop.fill", iconSize: (25, 25), iconPadding: 10)
                        Input(inputText: $viewModel.donacionOrganos, inputPrompt: "Donar órganos (SI/NO)", icon: "heart.text.square.fill", iconSize: (25, 25), iconPadding: 10)
                        Input(inputText: $viewModel.transfusionSanguinea, inputPrompt: "Donar Sangre (SI/NO)", icon: "drop.fill", iconSize: (25, 25), iconPadding: 10)
                        
                        // Se muestra un mensaje si es incorrecto
                        ErrorMessage(errorText: viewModel.error)

                        Button(action: {
                            // Call the addUsuarioDetalles function
                            Task {
                                await viewModel.addUsuarioDetalles()
                            }
                            // Navigate to Home after adding UsuarioDetalles
                            if viewModel.addedContacto {
                                path.append(HomeView.tag)
                            }
                        }) {
                            Text("Agregar Datos Médicos")
                                .foregroundColor(.white)
                                .bold()
                                .frame(width: 300, height: 55)
                                .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                .cornerRadius(25)
                                .padding(10)
                                .font(.title2)
                        }
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
            }
        }
    
    }

struct AgregarUsuarioDetallesView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarUsuarioDetallesView(path: .constant(NavigationPath()))
    }
}


