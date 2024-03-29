//
//  RecetaModel.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import Foundation

struct RecetaModel : Identifiable, Decodable, Hashable {
    var id: Int
    var nombre: String
    var fecha: String
    var nombrePersona: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idReceta"
        case nombre
        case fecha
        case nombrePersona
    }
}

struct CrearRecetaModel : Codable {
    var nombre: String
    var fecha: String
    var idMedico: Int?
}


extension RecetaModel  {
    public static var defaultReceta =   RecetaModel(id: 1, nombre: "Receta 1", fecha: "2021-02-30", nombrePersona: "Daniela Lopez")
    public static var defaultReceta1 =   RecetaModel(id: 2, nombre: "Receta 2", fecha: "2022-03-29", nombrePersona: "Daniela Lopez")
    public static var defaultReceta2 =   RecetaModel(id: 3, nombre: "Receta 3", fecha: "2023-04-30", nombrePersona: "Daniela Lopez")
    public static var defaultReceta3 =   RecetaModel(id: 4, nombre: "Receta 4", fecha: "2023-05-30", nombrePersona: "Daniela Lopez")
}
