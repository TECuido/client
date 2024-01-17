//
//  ContactoEmergenciaModel.swift
//  TECuido
//
//  Created by Alumno on 16/01/24.
//

import Foundation

struct ContactoEmergenciaInicioModel : Codable {
    var nombre: String
    var correo: String?
    var telefono: String
    var esContactoEmergencia: Bool?
    
       
    
}

extension ContactoEmergenciaInicioModel {
    // Asi se agrega un usuario default
    public static var defaultContacto : ContactoEmergenciaInicioModel{
        return ContactoEmergenciaInicioModel(nombre: "Panfila Lopez", telefono: "4445740322", esContactoEmergencia: true);
    }
   
}





struct ContactoDetallesModel: Codable {
    var idContacto: Int
    var nombre: String
    var correo: String?
    var telefono: String
    var idAgrega: Int
    var idAgregado: Int?
    var createdAt: String
    var updatedAt: String
}

struct DetallesUsuarioContactoModel: Codable {
    var idUsuariosDetalles: Int
    var idUsuario: Int
    var numPoliza: String
    var tipoSangre: String
    var idContactoEmergencia: Int
    var transfusionSanguinea: String
    var donacionOrganos: String
    var direccion: String
    var edad: String
    var medicoTratante: String
}

struct ContactoEmergeciaDetallesResponseModel: Codable {
    var contacto: ContactoDetallesModel
    var usuarioDetalles: DetallesUsuarioContactoModel
}
