//
//  MedicamentosActualesModel.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//

import Foundation


import Foundation

// Modelo debe ir en mayuscula
struct MedicamentosActualesModel : Identifiable, Decodable{
    var id: Int
    var nombre : String
    var motivo : String
    var idUsuario : Int
    
    enum CodingKeys: String, CodingKey {
        case id = "idAlergia"
        case nombre = "nombre"
        case motivo = "motivo"
        case idUsuario = "idUsuario"
    }
}
extension MedicamentosActualesModel  {
    public static var example =
    MedicamentosActualesModel (id: 1, nombre: "Loratadina",motivo: "Alergias",idUsuario: 1)
}
