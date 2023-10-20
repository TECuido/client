//
//  GrupoModel.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import Foundation

struct GrupoModel : Identifiable{
    var id = UUID()
    var nombre : String
}
extension GrupoModel {
    public static var exampleList = [
        GrupoModel(nombre: "Familia"),
        GrupoModel(nombre: "Amigos"),
        GrupoModel(nombre: "Contactos de emergencia")
    ]
}
