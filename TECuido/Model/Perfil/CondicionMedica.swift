//
//  CondicionMedica.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//

import Foundation

 // Modelo debe ir en mayuscula
 struct AgregaCondicionMedicaModel : Codable, Hashable {
     var nombre: String
     var idUsuario: Int
     enum CodingKeys: String, CodingKey {
         case nombre = "nombre"
         case idUsuario = "idUsuario"
     }


     func hash(into hasher: inout Hasher) {
         hasher.combine(nombre)
         hasher.combine(idUsuario)
     }
 }
 extension AgregaCondicionMedicaModel {
     public static var example =
     AgregaCondicionMedicaModel( nombre: "Polvo",idUsuario: 1)
 }


struct CondicionMedicaModel : Identifiable, Decodable, Hashable{
    var id: Int
    var nombre : String
    var idUsuario : Int
    
    enum CodingKeys: String, CodingKey {
        case id = "idCondicionMedica"
        case nombre = "nombre"
        case idUsuario
    }
    
    func hash(into hasher: inout Hasher) {
         hasher.combine(id)
         hasher.combine(nombre)
         hasher.combine(idUsuario)
     }
}
extension CondicionMedicaModel {
    public static var example =
    CondicionMedicaModel(id: 1, nombre: "Asma", idUsuario: 2)
}
