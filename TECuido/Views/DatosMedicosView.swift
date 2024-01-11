//
//  DatosMedicoaView.swift
//  TECuido
//
//  Created by Alumno on 11/01/24.
//
import SwiftUI

struct DatosMedicosView: View {
    let alergias = ["Alergia1", "Alergia2", "Alergia3"]
    let condicionesMedicas = ["fCondición1", "Condición2", "Condición3"]
    let medicamentos = ["Medicamento1", "Medicamento2", "Medicamento3"]
    @State private var mostrarAlergias = false
    @State private var mostrarCondiciones = false
    @State private var mostrarMedicamentos = false

    var body: some View {
        NavigationView {
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
                            ForEach(alergias, id: \.self) { alergia in
                                Text(alergia)
                                    .font(.headline)
                                    .frame(width: 200)
                                    .font(.system(size: 25))
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                            }
                            // Botón "+" que lleva a AlergiasView
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
                    }.font(.system(size: 20)) // Tamaño del título
                    
                    // Condiciones Médicas
                    DisclosureGroup("Condiciones Médicas", isExpanded: $mostrarCondiciones) {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(condicionesMedicas, id: \.self) { condicion in
                                Text(condicion)
                                    .font(.headline)
                                    .frame(width: 200)
                                    .font(.system(size: 25))
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                            }
                            // Botón "+" que lleva a CondicionMedicaView
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
                    }.font(.system(size: 20)) // Tamaño del título
                    
                    // Medicamentos
                    DisclosureGroup("Medicamentos", isExpanded: $mostrarMedicamentos) {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(medicamentos, id: \.self) { medicamento in
                                Text(medicamento)
                                    .font(.headline)
                                    .frame(width: 200)
                                    .font(.system(size: 25))
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                            }
                            // Botón "+" que lleva a MedicamentoActualView
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
                }
                .padding()
            }.font(.system(size: 20)) // Tamaño del título
        } .background(Color.white)
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
