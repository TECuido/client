//
//  EmergenciasGrupoModel.swift
//  TECuido
//
//  Created by Alumno on 15/01/24.
//

import Foundation

struct EmergenciaGrupoModel : Codable {
    var tipo: String
    var descripcion: String?
    var idEmisor: Int
    var idGrupo: Int
    var longitud: Float?
    var latitud: Float?
}
