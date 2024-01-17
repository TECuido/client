//
//  AgregarContactoModel.swift
//  TECuido
//
//  Created by Julio on 25/10/23.
//

import Foundation

struct AgregarContactoModel : Codable {
    var nombre: String
    var telefono: String
    var correo: String?
}

struct ContactoAgregadoModel: Decodable {
    var idContacto: Int
}
