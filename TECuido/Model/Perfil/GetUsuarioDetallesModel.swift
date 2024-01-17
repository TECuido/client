//
 //  GetUsuarioDetallesModel.swift
 //  TECuido
 //
 //  Created by Alumno on 12/01/24.
 //

 import Foundation



struct UsuarioDetallesGetModel: Decodable {
    var idUsuariosDetalles: Int
    var idUsuario: Int
    var Usuario: UsuarioModel
    var numPoliza: String
    var tipoSangre: String
    var idContactoEmergencia: Int
    var contactoEmergencia: ContactoModel
    var transfusionSanguinea: String
    var donacionOrganos: String
    var direccion: String
    var edad: String
    var medicoTratante: String


    struct UsuarioModel: Decodable {
        var nombre: String
    }


    struct ContactoModel: Decodable {
        var nombre: String
        var correo: String?
        var telefono: String?
    }
}



struct EditarUsuarioDetallesModel: Codable{
    var numPoliza: String
       var tipoSangre: String
       var contactoEmergencia: String
       var transfusionSanguinea: String
       var donacionOrganos: String
       var direccion: String
       var edad: String
       var medicoTratante: String
       var nombre: String
    
    
    enum CodingKeys: String, CodingKey {
        case numPoliza
        case tipoSangre
        case contactoEmergencia
        case transfusionSanguinea
        case donacionOrganos
        case direccion
        case edad
        case medicoTratante
        case nombre
    }
}


struct UsuarioUpdateResponse: Decodable {
        let usuario: UsuarioData
        let usuarioUpdate: UsuarioUpdate
}


struct UsuarioData: Decodable {
    let count: Int
}

struct UsuarioUpdate: Decodable {
    let idUsuario: Int
    let nombre: String
    let correo: String
    let password: String
    let idTipo: Int
    let token: String?
    let createdAt: String
    let updatedAt: String
}



