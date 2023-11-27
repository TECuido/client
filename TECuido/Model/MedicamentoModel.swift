//
//  MedicamentoModel.swift
//  TECuido
//
//  Created by Alumno on 14/11/23.
//

import Foundation


struct MedicamentoModel: Decodable, Identifiable {
    var id: Int
    var nombre: String
    var dosis: String
    var frecuencia: String
    var duracion: String
}

extension MedicamentoModel  {
    public static var defaultMedicamento1 =  MedicamentoModel(id: 1, nombre: "Aspirina", dosis: "2 tabletas", frecuencia: "Cada 8 hotas", duracion: "Por 3 días")
    public static var defaultMedicamento2 = MedicamentoModel(id: 2, nombre: "Paracetamol", dosis: "3 pastillas", frecuencia: "Por la mañana", duracion: "Por 3 días")
}
