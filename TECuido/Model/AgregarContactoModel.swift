//
//  AgregarContactoModel.swift
//  TECuido
//
//  Created by Julio on 25/10/23.
//

    import Foundation

    struct AgregarContactoModel : Codable {
        var correo: String
    }

    struct ContactoAgregadoModel: Decodable {
        var idAgrega: Int
        var idAgregado: Int
    }
