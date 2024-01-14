//
 //  GetUsuarioDetallesModel.swift
 //  TECuido
 //
 //  Created by Alumno on 12/01/24.
 //

 import Foundation

 struct ContactoEmergenciaModel: Decodable {
     var nombre: String
     var correo: String
 }

 struct GetUsuarioDetallesModel: Decodable {
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
     var contactoEmergencia: ContactoEmergenciaModel
     var Usuario: UsuarioDetalleModel
     enum CodingKeys: String, CodingKey {
         case idUsuariosDetalles
         case idUsuario
         case numPoliza
         case tipoSangre
         case idContactoEmergencia
         case transfusionSanguinea
         case donacionOrganos
         case direccion
         case edad
         case medicoTratante
         case contactoEmergencia
         case Usuario
     }
 }

 struct UsuarioDetalleModel: Decodable {
     var nombre: String
     enum CodingKeys: String, CodingKey {
         case nombre
     }
 }



struct UsuarioUpdateModel: Codable {
    let idUsuario: Int
    let nombre: String
    let correo: String
    let password: String
    let idTipo: Int
    let token: String?
    let createdAt: String
    let updatedAt: String
}


struct EditarUsuarioDetallesModel: Codable {
    let numPoliza: String
    let tipoSangre: String
    let contactoEmergencia: String
    let transfusionSanguinea: String
    let donacionOrganos: String
    let direccion: String
    let edad: String
    let medicoTratante: String
    let nombre: String
}


struct CombinedUsuarioModel: Codable {
    let usuarioUpdate: UsuarioUpdateModel
    let editarUsuarioDetalles: EditarUsuarioDetallesModel


    enum CodingKeys: String, CodingKey {
        case usuarioUpdate
        case editarUsuarioDetalles
    }
}



