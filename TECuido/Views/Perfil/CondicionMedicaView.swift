//
//  CondicionMedicaView.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//

import SwiftUI

struct CondicionMedicaView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = CondicionMedicaViewModel()
    @Binding var path: NavigationPath

    static var tag = "CondicionMedica"
    var body: some View {
      
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                // Titulo
                Title(text:"Agrega una condición médica")

                // Input Nombre
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 140, height: 140)
                    .foregroundColor(Color("LightBlue"))
                    .padding(.top, 20)

                // Input de la Alergia
                Input(inputText: $viewModel.nombre,
                      inputPrompt: "Nombre de la condición",
                      icon: "heart.fill",
                      iconSize: (30, 20),
                      iconPadding: 15,
                      inputError: viewModel.nombreError)
                    .padding(.top, 20)

                ErrorMessage(errorText: viewModel.error)
                    .padding(.bottom, -10)

                PrimaryButton(title: "Enviar") {
                    Task {
                        await viewModel.crearCondicion()
                    }
                }

                // Modal
                .alert(isPresented: $viewModel.condicionCreada) {
                    AcceptAlert(
                        title: "Condición Médica Agregada",
                        message: "Se agregó la condición médica con éxito"
                    ) {
                        viewModel.nombre = ""
                        path.removeLast()
                    }
                }
            }
        }
    }
}

struct CondicionMedicaView_Previews: PreviewProvider {
    static var previews: some View {
        CondicionMedicaView(path: .constant(NavigationPath()))
    }
}
