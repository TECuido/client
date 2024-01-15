//
//  MedicamentoModel.swift
//  TECuido
//
//  Created by Alumno on 14/11/23.
//

import Foundation

struct MedicamentoRecetaModel: Decodable {
    var medicamentoReceta: [MedicamentoModel]
    
    enum CodingKeys: String, CodingKey {
        case medicamentoReceta
    }
}

extension MedicamentoRecetaModel  {
    public static var defaultMedicamento1 =  MedicamentoRecetaModel(medicamentoReceta: [MedicamentoModel.defaultMedicamento1, MedicamentoModel.defaultMedicamento2])
}

struct MedicamentoModel: Decodable, Identifiable, Hashable {
    var id: Int
    var nombre: String
    var dosis: String
    var frecuencia: String
    var duracion: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMedicamentoReceta"
        case nombre
        case dosis
        case frecuencia
        case duracion
    }
}

extension MedicamentoModel  {
    public static var defaultMedicamento1 =  MedicamentoModel(id: 1, nombre: "Aspirina", dosis: "2 tabletas", frecuencia: "Cada 8 hotas", duracion: "Por 3 días")
    public static var defaultMedicamento2 = MedicamentoModel(id: 2, nombre: "Paracetamol", dosis: "3 pastillas", frecuencia: "Por la mañana", duracion: "Por 3 días")
}


struct CrearMedicamentoModel: Codable {
    var nombre: String
    var dosis: String
    var frecuencia: String
    var duracion: String
}

extension CrearMedicamentoModel  {
    public static var defaultMedicamento1 =  CrearMedicamentoModel(nombre: "Aspirina", dosis: "2 tabletas", frecuencia: "Cada 8 hotas", duracion: "Por 3 días")
}
