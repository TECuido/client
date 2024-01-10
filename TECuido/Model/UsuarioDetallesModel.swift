//
//  UsuarioDetallesModel.swift
//  TECuido
//
//  Created by Alumno on 08/01/24.
//

import Foundation


struct UsuarioDetallesModel : Decodable, Identifiable{
    var id: Int
    var idUsuario: UsuarioModel
    var numPoliza: Int
    var tipoSangre: String
    var idContactoEmergencia: UsuarioModel
    var transfusionSanguinea: String
    var donacionOrganos: String
    var direccion: String
    var edad: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idUsuariosDetalles"
        case idUsuario
        case numPoliza = "numPoliza"
        case tipoSangre = "tipoSangre"
        case idContactoEmergencia
        case transfusionSanguinea = "transfusionSanguinea"
        case donacionOrganos = "donacionOrganos"
        case direccion = "direccion"
        case edad = "edad"
    }
    
}

extension UsuarioDetallesModel  {
    // Asi se agrega un usuario default
    public static var defaultContacto : UsuarioDetallesModel{
        return UsuarioDetallesModel(id: 1,idUsuario:  UsuarioModel(id: 1, nombre: "Panfila Lopez", correo: "pan@gmail.com"),numPoliza: 1, tipoSangre: "O+",idContactoEmergencia: UsuarioModel(id: 1, nombre: "Panfila Lopez", correo: "pan@gmail.com"),transfusionSanguinea: "Si", donacionOrganos: "Si",direccion: "Si",  edad: "32"
        );
    }
   
}

