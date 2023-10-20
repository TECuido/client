//
//  ContactoModel.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import Foundation

struct UsuarioAgregado {
    var nombre : String
    var correo : String
}

struct ContactoModel : Identifiable{
    var id = UUID()
    var data = [UsuarioAgregado]()
    
}
extension ContactoModel  {
    // Asi se agrega un usuario default
    public static var defaultContacto : ContactoModel{
        return ContactoModel(data: [UsuarioAgregado(nombre: "Panfila Lopez", correo: "pan@gmail.com")])
    }
   
}
