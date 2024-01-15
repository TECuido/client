//
//  NotificationTokenModel.swift
//  TECuido
//
//  Created by Alumno on 05/11/23.
//

import Foundation


struct NotificationTokenModel : Codable {
    var token: String
}

struct UsuarioTokenModel: Decodable {
    var idUsuario: Int
    var token: String
}
