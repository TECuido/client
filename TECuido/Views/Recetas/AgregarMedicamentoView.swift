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
            
            Input(
                inputText: $medicamento.nombre,
                inputPrompt: "Nombre del medicamento",
                icon: "pill.fill",
                iconSize: (20, 20),
                iconPadding: 15
            )
            
            Input(
                inputText: $medicamento.dosis,
                inputPrompt: "Dosis",
                icon: "number",
                iconSize: (20, 20),
                iconPadding: 15
            )
            
            Input(
                inputText: $medicamento.frecuencia,
                inputPrompt: "Frecuencia",
                icon: "clock.fill",
                iconSize: (20, 20),
                iconPadding: 15
            )
            
            Input(
                inputText: $medicamento.duracion,
                inputPrompt: "Duración",
                icon: "calendar",
                iconSize: (20, 20),
                iconPadding: 15
            )
            
        }
    }
}

struct AgregarMedicamentoView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarMedicamentoView(medicamento: .constant(CrearMedicamentoModel.defaultMedicamento1))
    }
}
