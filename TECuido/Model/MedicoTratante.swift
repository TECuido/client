//
//  MedicoTratante.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//

import Foundation

struct MedicoTratanteModel : Identifiable, Decodable{
    var id: Int
    var nombre : String
    var especialidad : String
    var idUsuario : Int
    
    enum CodingKeys: String, CodingKey {
        case id = "idMedicoTratante"
        case nombre = "nombre"
        case especialidad = "especialidad"
        case idUsuario = "idUsuario"
    }
}
extension MedicoTratanteModel  {
    public static var example =
    MedicoTratanteModel (id: 1, nombre: "Loratadina",especialidad: "Alergias",idUsuario: 1)
}
