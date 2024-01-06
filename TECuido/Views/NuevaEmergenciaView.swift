//
//  NuevaEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 29/12/23.
//

import SwiftUI

struct NuevaEmergenciaView: View {
    
    @StateObject private var viewModel = MandarEmergenciaViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text("Emergencias")
                    .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                    .font(.system(size: 45))
                    .bold()
                    .padding()

                // Fila 1 - Emergency Buttons in Pairs
                HStack {
                    ForEach(0..<viewModel.motivos.count / 2) { rowIndex in
                        HStack {
                            ForEach(0..<2) { colIndex in
                                let index = rowIndex * 2 + colIndex
                                let motivo = viewModel.motivos[index]
                                let iconName = viewModel.motivoIconMapping[motivo] ?? "questionmark.circle.fill"
                                
                                Button(action: {
                                    viewModel.updateSelectedMotivo(motivo: motivo)
                                }) {
                                    BotonEmergencia(title: motivo, iconName: iconName, hint: "Manda una notificación de \(motivo.lowercased())")
                                }
                                .background(viewModel.isSelected(motivo: motivo) ? Color.blue.opacity(0.5) : Color.clear)
                                .padding(.horizontal, 10)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }

                // Selección de contactos
                Text("Selecciona los contactos a avisar")
                    .font(.title2)
                    .frame(width: 340)
                    .multilineTextAlignment(.center)

                Picker("Selecciona un contacto", selection: $viewModel.selectedOptionContacto) {
                    ForEach(viewModel.gruposNombres, id: \.self) { grupo in
                        Text(grupo)
                            .font(.title)
                    }
                }
                .task {
                    await viewModel.getGrupos()
                }

                // Acaban las filas
                Button("Continuar") {
                    Task {
                        await viewModel.addEmergencia()
                        viewModel.resetSelectedMotivos()
                    }
                }
                .foregroundColor(.white)
                .bold()
                .frame(width: 300, height: 55)
                .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                .cornerRadius(25)
                .padding(30)
                .font(.title2)
            }
        }
        .background(Color.white) // Add background color to fix compilation issue
    }

    private func BotonEmergencia(title: String, iconName: String, hint: String) -> some View {
        ZStack {
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.title2)
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
            }
            .frame(width: 145, height: 112)
            .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
            .cornerRadius(16)
            .padding(5)
            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
            .font(.title)
            .accessibilityLabel(title)
            .accessibilityHint(hint)
        }
    }

    struct NuevaEmergenciaView_Previews: PreviewProvider {
        static var previews: some View {
            NuevaEmergenciaView()
        }
    }
}
