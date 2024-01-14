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
