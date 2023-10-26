//
//  ContactoModel.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import Foundation

struct ContactoModel : Decodable, Identifiable{
    var id = UUID()
    var usuarioAgregado: UsuarioModel
    
    enum CodingKeys: String, CodingKey {
        case usuarioAgregado
    }
    
}

extension ContactoModel {
    // Asi se agrega un usuario default
    public static var defaultContacto : ContactoModel{
        return ContactoModel(usuarioAgregado: UsuarioModel(nombre: "Panfila Lopez", correo: "pan@gmail.com"));
    }
   
}
