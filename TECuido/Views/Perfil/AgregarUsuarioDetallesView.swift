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
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    HStack {
                        Spacer()
                        Title(text:"Datos de pérfil médico")
                           
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
                        
                        //Boton
                        PrimaryButton(title: "Agregar"){
                            Task {
                                await viewModel.addUsuarioDetalles()
                            }
                            if viewModel.addedContacto {
                                path.append(HomeView.tag)
                            }
                        }
                        .padding(.top, 10)
                    }
                }
                
            }
        }

}

struct AgregarUsuarioDetallesView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarUsuarioDetallesView(path: .constant(NavigationPath()))
    }
}
