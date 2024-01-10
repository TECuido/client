//
//  AlergiaModel.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//

import Foundation

// Modelo debe ir en mayuscula
struct AlergiaModel : Identifiable, Decodable{
    var id: Int
    var nombre : String
    var idUsuario : Int
    
    enum CodingKeys: String, CodingKey {
        case id = "idAlergia"
        case nombre = "nombre"
        case idUsuario = "idUsuario"
    }
}
extension AlergiaModel {
    public static var example =
    AlergiaModel(id: 1, nombre: "Polvo",idUsuario: 1)
}
