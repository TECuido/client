//
//  AgregarMedicamentoView.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

struct AgregarMedicamentoView: View {
    @Binding var medicamento: CrearMedicamentoModel
    
    var body: some View {
                
        VStack {
            
            HStack {
                Image(systemName: "pill.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                    .padding(.leading, 15)
                TextField("",
                          text: $medicamento.nombre,
                          prompt: Text("Nombre del medicamento")
                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                )
                .font(.title3)
                .padding(.leading, 5)
                .autocapitalization(.none)
            }
            .frame(width: 325, height: 55)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(20)
            .padding([.top, .bottom], 10)
            
            HStack {
                Image(systemName: "number")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                    .padding(.leading, 15)
                TextField("",
                          text: $medicamento.dosis,
                          prompt: Text("Dosis")
                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                )
                .font(.title3)
                .padding(.leading, 5)
                .autocapitalization(.none)
            }
            .frame(width: 325, height: 55)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(20)
            .padding([.top, .bottom], 10)
            
            HStack {
                Image(systemName: "clock.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                    .padding(.leading, 15)
                TextField("",
                          text: $medicamento.frecuencia,
                          prompt: Text("Frecuencia")
                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                )
                .font(.title3)
                .padding(.leading, 5)
                .autocapitalization(.none)
            }
            .frame(width: 325, height: 55)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(20)
            .padding([.top, .bottom], 10)
            
            HStack {
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                    .padding(.leading, 15)
                TextField("",
                          text: $medicamento.duracion,
                          prompt: Text("Duración")
                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                )
                .font(.title3)
                .padding(.leading, 5)
                .autocapitalization(.none)
            }
            .frame(width: 325, height: 55)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(20)
            .padding([.top, .bottom], 10)
            
        }
    }
}

struct AgregarMedicamentoView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarMedicamentoView(medicamento: .constant(CrearMedicamentoModel.defaultMedicamento1))
    }
}
