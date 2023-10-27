//
//  RecetaModel.swift
//  TECuido
//
//  Created by Alumno on 27/10/23.
//

import Foundation

struct RecetaDetalleModel : Identifiable{
    var id = UUID()
    var nombreMedicamento: String
    var frecuencia: String
    var dosis: String
    var tiempo: String
}


extension RecetaDetalleModel  {
    public static var defaultReceta =   RecetaDetalleModel(nombreMedicamento: "Paracetamol", frecuencia: "Cada 8 horas", dosis: "50 ml", tiempo:"por 3 dias")
    public static var defaultReceta1 =   RecetaDetalleModel(nombreMedicamento: "Ibuprofeno", frecuencia: "Cada 8 horas", dosis: "50 ml", tiempo:"por 3 dias")
    public static var defaultReceta2 =   RecetaDetalleModel(nombreMedicamento: "Loratadina", frecuencia: "Cada 8 horas", dosis: "50 ml", tiempo:"por 3 dias")
    public static var defaultReceta3 =   RecetaDetalleModel(nombreMedicamento: "Complejo B", frecuencia: "Cada 8 horas", dosis: "50 ml", tiempo:"por 3 dias")
}
