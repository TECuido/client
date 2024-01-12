//
//  AlergiaModel.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//

import Foundation

struct AlergiaModel: Codable, Hashable {
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

extension AlergiaModel {
    static var example = AlergiaModel(nombre: "Polvo", idUsuario: 1)
}
