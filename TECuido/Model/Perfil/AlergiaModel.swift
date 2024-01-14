//
//  AlergiaModel.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//
import Foundation
 struct AgregaAlergiaModel: Codable, Hashable {
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
extension AgregaAlergiaModel {
    static var example = AgregaAlergiaModel(nombre: "Polvo", idUsuario: 1)
}

struct AlergiaModel : Identifiable, Decodable, Hashable{
    var id: Int
    var nombre : String
    var idUsuario : Int
    
    enum CodingKeys: String, CodingKey {
        case id = "idAlergia"
        case nombre = "nombre"
        case idUsuario
    }
    
    func hash(into hasher: inout Hasher) {
         hasher.combine(id)
         hasher.combine(nombre)
         hasher.combine(idUsuario)
     }
}
extension AlergiaModel {
    public static var example =
    AlergiaModel(id: 1, nombre: "Polvo", idUsuario: 2)
}
