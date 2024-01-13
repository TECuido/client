//  DatosMedicoaView.swift
//  TECuido
//
//  Created by Alumno on 11/01/24.
//
import SwiftUI

struct DatosMedicosView: View {
    @State private var mostrarAlergias = false
    @State private var mostrarCondiciones = false
    @State private var mostrarMedicamentos = false
    @StateObject var viewModel = AlergiaViewModel()
    @StateObject var viewModel1 = CondicionMedicaViewModel()
    @StateObject var viewModel2 = MedicamentosActualesViewModel()

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    // Titulo
                    Text("Datos Medicos")
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .font(.system(size: 50))
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(.top, 30)
                        .multilineTextAlignment(.center)

                    // Alergias
                    DisclosureGroup("Alergias", isExpanded: $mostrarAlergias) {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel.alergias, id: \.self) { alergia in
                                Text(alergia.nombre)
                                    .font(.headline)
                                    .frame(width: 200)
                                    .font(.system(size: 25))
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                            }

                            NavigationLink(destination: AlergiaView()) {
                                HStack {
                                    Spacer()
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.blue)
                                        .font(.headline)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                                }
                            }
                        }
                        .padding()
                    }
                    .font(.system(size: 20))
                    .onAppear {
                        Task {
                            await viewModel.getAlergias()
                        }
                    }

                    // Condiciones Médicas
                    DisclosureGroup("Condiciones Médicas", isExpanded: $mostrarCondiciones) {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel1.condicion, id: \.self) { condiciones in
                                Text(condiciones.nombre)
                                    .font(.headline)
                                    .frame(width: 200)
                                    .font(.system(size: 25))
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                            }

                            NavigationLink(destination: CondicionMedicaView()) {
                                HStack {
                                    Spacer()
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.blue)
                                        .font(.headline)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                                }
                            }
                        }
                        .padding()
                    }
                    .font(.system(size: 20))
                    .onAppear {
                        Task {
                            await viewModel1.getCondicionMedica()
                        }
                    }


                    // Medicamentos
                    DisclosureGroup("Medicamentos", isExpanded: $mostrarMedicamentos) {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel2.medicamento, id: \.self) { medicamento in
                                Text(medicamento.nombre)
                                    .font(.headline)
                                    .frame(width: 200)
                                    .font(.system(size: 25))
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                            }

                            NavigationLink(destination: MedicamentoActualView()) {
                                HStack {
                                    Spacer()
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.blue)
                                        .font(.headline)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                                }
                            }
                        }
                        .padding()
                    }
                    .font(.system(size: 20))
                    .onAppear {
                        Task {
                            await viewModel2.getMedicamentosActuales()
                        }
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

    struct DatosMedicoaView_Previews: PreviewProvider {
        static var previews: some View {
            DatosMedicosView()
        }
    }
}
