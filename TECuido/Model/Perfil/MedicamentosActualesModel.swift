//
//  MedicamentosActualesModel.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//

import Foundation

struct MedicamentosActualesModel : Codable, Hashable {
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
extension MedicamentosActualesModel  {
    public static var example =
    MedicamentosActualesModel ( nombre: "Loratadina"  ,idUsuario: 1)
}
