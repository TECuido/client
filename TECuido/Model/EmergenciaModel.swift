//
//  EmergenciaModel.swift
//  TECuido
//
//  Created by Alumno on 06/11/23.
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

struct EmergenciaContactosModel : Codable {
    var tipo: String
    var descripcion: String?
    var idEmisor: Int
    var longitud: Float?
    var latitud: Float?
}

struct DataEmergenciaGrupoModel : Decodable {
    var idEmergencia: Int
    var tipo: String
    var descripcion: String?
    var idEmisor: Int
    var longitud: Float?
    var latitud: Float?
    var emisor: String?
}

extension DataEmergenciaGrupoModel  {
    public static var defaultEmergencia = DataEmergenciaGrupoModel(idEmergencia: -1, tipo: "Médica", descripcion: "Emergencia médica", idEmisor: 1, longitud: 50, latitud: 50, emisor: "Juan Pérez")
}
