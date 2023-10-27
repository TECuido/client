//
//  AgregarGrupoModel.swift
//  TECuido
//
//  Created by Alumno on 27/10/23.
//

import Foundation

struct AgregarGrupoModel : Codable {
    var nombre: String
    var idCreador: Int
}

struct GrupoAgregadoModel: Decodable {
    var idGrupo: Int
    var nombre: String
    var idCreador: Int
}
