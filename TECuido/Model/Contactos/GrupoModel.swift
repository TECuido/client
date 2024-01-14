//
//  GrupoModel.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import Foundation

struct GrupoModel : Identifiable, Decodable, Hashable{
    var id: Int
    var nombre : String
    
    enum CodingKeys: String, CodingKey {
        case id = "idGrupo"
        case nombre = "nombre"
    }
}
extension GrupoModel {
    public static var example =
        GrupoModel(id: 1, nombre: "Familia")
}

struct EditarNombreGrupoModel : Codable {
    var nombre: String
}
