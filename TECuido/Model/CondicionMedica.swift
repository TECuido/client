//
//  CondicionMedica.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//

import Foundation

 // Modelo debe ir en mayuscula
 struct CondicionMedicaModel : Codable, Hashable {
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
 extension CondicionMedicaModel {
     public static var example =
     CondicionMedicaModel( nombre: "Polvo",idUsuario: 1)
 }
