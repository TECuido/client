//
//  CondicionMedica.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//

import Foundation

// Modelo debe ir en mayuscula
struct CondicionMedicaModel : Identifiable, Decodable{
    var id: Int
    var nombre : String
    var idUsuario : Int
    
    enum CodingKeys: String, CodingKey {
        case id = "idCondicionMedica"
        case nombre = "nombre"
        case idUsuario = "idUsuario"
    }
}
extension CondicionMedicaModel {
    public static var example =
    CondicionMedicaModel(id: 1, nombre: "Polvo",idUsuario: 1)
}
