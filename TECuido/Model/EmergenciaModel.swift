//
//  EmergenciaModel.swift
//  TECuido
//
//  Created by Alumno on 06/11/23.
//

import Foundation
// Modelo debe ir en mayuscula
struct EmergenciaModel : Decodable, Identifiable{
    var id: Int
    var tipo : String
    var correo : String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "idUsuario"
        case nombre
        case correo
    }
}
extension EmergenciaModel  {
    public static var defaultUsuario = UsuarioModel(id: 1, nombre: "Panfila Lopez", correo: "pan@gmail.com")
    public static var defaultUsuario2 = UsuarioModel(id: 2, nombre: "Daniela Lopez", correo: "dany@gmail.com")
    public static var defaultUsuario3 = UsuarioModel(id: 3, nombre: "Juan Camilo Perez", correo: "juanca@gmail.com")
}
