//
//  AgregarMiembroModel.swift
//  TECuido
//
//  Created by Alumno on 27/10/23.
//

import Foundation

struct AgregarMiembroModel : Codable {
    var idMiembro: Int
    var idGrupo: Int
}

struct MiembroAgregadoModel: Decodable {
    var idGrupo: Int
    var idMiembro: Int
}
