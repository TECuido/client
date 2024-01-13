//
//  UsuarioModel.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//
import Foundation
// Modelo debe ir en mayuscula
struct UsuarioModel : Decodable, Identifiable{
    var id: Int
    var nombre : String
    var correo : String
    
    enum CodingKeys: String, CodingKey {
        case id = "idUsuario"
        case nombre
        case correo
    }
}
extension UsuarioModel  {
    public static var defaultUsuario = UsuarioModel(id: 1, nombre: "Panfila Lopez", correo: "pan@gmail.com")
    public static var defaultUsuario2 = UsuarioModel(id: 2, nombre: "Daniela Lopez", correo: "dany@gmail.com")
    public static var defaultUsuario3 = UsuarioModel(id: 3, nombre: "Juan Camilo Perez", correo: "juanca@gmail.com")
}
