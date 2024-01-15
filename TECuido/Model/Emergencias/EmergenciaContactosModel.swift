//
//  EmergenciasContactoModel.swift
//  TECuido
//
//  Created by Alumno on 15/01/24.
//

import Foundation

struct EmergenciaContactosModel : Codable {
    var tipo: String
    var descripcion: String?
    var idEmisor: Int
    var longitud: Float?
    var latitud: Float?
}
