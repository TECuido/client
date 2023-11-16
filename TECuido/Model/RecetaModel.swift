//
//  RecetaModel.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import Foundation

struct RecetaModel : Identifiable, Decodable{
    var id = UUID()
    var nombre: String
    var fecha: String
    var doctor: String 
}


extension RecetaModel  {
    public static var defaultReceta =   RecetaModel(nombre: "Receta 1", fecha: "2021-02-30", doctor: "Daniela Lopez")
    public static var defaultReceta1 =   RecetaModel(nombre: "Receta 2", fecha: "2022-03-29", doctor: "Daniela Lopez")
    public static var defaultReceta2 =   RecetaModel(nombre: "Receta 3", fecha: "2023-04-30", doctor: "Daniela Lopez")
    public static var defaultReceta3 =   RecetaModel(nombre: "Receta 4", fecha: "2023-05-30", doctor: "Daniela Lopez")
}
