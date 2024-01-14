//
//  MedicamentosActualesModel.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//

import Foundation

struct AgregaMedicamentosActualesModel : Codable, Hashable {
    var nombre: String
    var idUsuario: Int
    enum CodingKeys: String, CodingKey {
        case nombre = "nombre"
        case idUsuario = "idUsuario"
    }


    func hash(into hasher: inout Hasher) {
        hasher.combine(nombre)
        hasher.combine(idUsuario)
    }
}
extension AgregaMedicamentosActualesModel  {
    public static var example =
    AgregaMedicamentosActualesModel ( nombre: "Loratadina"  ,idUsuario: 1)
}

struct MedicamentosActualesModel : Identifiable, Decodable, Hashable{
    var id: Int
    var nombre : String
    var idUsuario : Int
    
    enum CodingKeys: String, CodingKey {
        case id = "idMedicamentoActual"
        case nombre = "nombre"
        case idUsuario
    }
    
    func hash(into hasher: inout Hasher) {
         hasher.combine(id)
         hasher.combine(nombre)
         hasher.combine(idUsuario)
     }
}
extension MedicamentosActualesModel {
    public static var example =
    MedicamentosActualesModel(id: 1, nombre: "Polvo", idUsuario: 2)
}
