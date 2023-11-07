//
//  EmergenciaModel.swift
//  TECuido
//
//  Created by Alumno on 06/11/23.
//

import Foundation

struct EmergenciaModel : Codable {
    var tipo: String
    var descripcion: String?
    var idEmisor: Int
    var idReceptor: Int
    var longitud: String
    var latitud: String
}
