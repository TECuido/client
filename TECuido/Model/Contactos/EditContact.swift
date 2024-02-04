//
//  EditContact.swift
//  TECuido
//
//  Created by Alumno on 03/02/24.
//

import Foundation

struct EditContactModel : Codable {
 var nombre: String
 var correo: String?
 var telefono: String
}


struct ResponseEditContact: Codable {
    var idContacto: Int
    var nombre: String
    var correo: String?
    var telefono: String
    var idAgrega: Int
    var idAgregado: Int?
    var createdAt: String
    var updatedAt: String
}
