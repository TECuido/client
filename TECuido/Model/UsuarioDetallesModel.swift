//
//  UsuarioDetallesModel.swift
//  TECuido
//
//  Created by Alumno on 08/01/24.
//
import Foundation
struct UsuarioDetallesModel: Codable {
   
    var numPoliza: String?
    var tipoSangre: String?
    var contactoEmergencia: String
    var transfusionSanguinea: String?
    var donacionOrganos: String?
    var direccion: String?
    var edad: String?
    var medicoTratante: String?
    enum CodingKeys: String, CodingKey {
    
        case numPoliza
        case tipoSangre
        case contactoEmergencia
        case transfusionSanguinea
        case donacionOrganos
        case direccion
        case edad
        case medicoTratante
    }
}

