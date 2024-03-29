//
//  ContactoModel.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import Foundation

struct ContactoModel : Decodable, Identifiable {
    var id: Int
    var nombre: String
    var telefono: String
    var correo: String?
    var usuarioAgregado: UsuarioAgregado?
    
    enum CodingKeys: String, CodingKey {
        case id = "idContacto"
        case nombre = "nombre"
        case telefono = "telefono"
        case correo = "correo"
        case usuarioAgregado = "usuarioAgregado"
    }
    
}

struct UsuarioAgregado: Decodable {
    var idUsuario: Int
}

extension ContactoModel {
    // Asi se agrega un usuario default
    public static var defaultContacto : ContactoModel{
        return ContactoModel(id: 1, nombre: "Panfila Lopez", telefono: "4445740322");
    }
   
}
