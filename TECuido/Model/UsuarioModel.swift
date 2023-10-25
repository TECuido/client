//
//  UsuarioModel.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//
import Foundation
// Modelo debe ir en mayuscula
struct UsuarioModel  : Identifiable{
    var id = UUID()
    var nombre : String?
    var correo : String
    var password : String
}

extension UsuarioModel  {
    public static var defaultUsuario = UsuarioModel(nombre: "Panfila Lopez", correo: "pan@gmail.com", password: "12345678")
    public static var defaultUsuario2 = UsuarioModel(nombre: "Daniela Lopez", correo: "dany@gmail.com", password: "12345678")
    public static var defaultUsuario3 = UsuarioModel(nombre: "Juan Camilo Perez", correo: "juanca@gmail.com", password: "12345678")

    
}
