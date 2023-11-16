//
//  MedicamentoModel.swift
//  TECuido
//
//  Created by Alumno on 14/11/23.
//

import Foundation


struct MedicamentoModel: Decodable, Identifiable {
    var id: Int
    var nombre: String
    var dosis: Int
    var unidadDosis: String
    var frecuencia: Int?
    var unidadFrecuencia: String?
    var momentoConsumo: String?
    var duracion: Int
    var unidadDuracion: String
    
}
