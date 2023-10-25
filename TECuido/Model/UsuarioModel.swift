//
//  UsuarioModel.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//
import Foundation
// Modelo debe ir en mayuscula
struct UsuarioModel : Decodable, Identifiable{
    var id = UUID()
    var nombre : String
    var correo : String
    
    enum CodingKeys: String, CodingKey {
        case nombre
        case correo
    }
}
extension UsuarioModel  {
    public static var defaultUsuario = UsuarioModel(nombre: "Panfila Lopez", correo: "pan@gmail.com")
    public static var defaultUsuario2 = UsuarioModel(nombre: "Daniela Lopez", correo: "dany@gmail.com")
    public static var defaultUsuario3 = UsuarioModel(nombre: "Juan Camilo Perez", correo: "juanca@gmail.com")
    public static var defaultUsuario4 = UsuarioModel(nombre: "Juan Camilo Perez", correo: "juanca@gmail.com")
    public static var defaultUsuario5 = UsuarioModel(nombre: "Juan Camilo Perez", correo: "juanca@gmail.com")
    public static var defaultUsuario6 = UsuarioModel(nombre: "Panfila Lopez", correo: "pan@gmail.com")
    public static var defaultUsuario7 = UsuarioModel(nombre: "Daniela Lopez", correo: "dany@gmail.com")
    public static var defaultUsuario8 = UsuarioModel(nombre: "Juan Camilo Perez", correo: "juanca@gmail.com")
    public static var defaultUsuario9 = UsuarioModel(nombre: "Juan Camilo Perez", correo: "juanca@gmail.com")
    public static var defaultUsuario10 = UsuarioModel(nombre: "Juan Camilo Perez", correo: "juanca@gmail.com")
    public static var defaultUsuario11 = UsuarioModel(nombre: "Juan Camilo Perez", correo: "juanca@gmail.com")
    public static var defaultUsuario12 = UsuarioModel(nombre: "Juan Camilo Perez", correo: "juanca@gmail.com")
}
