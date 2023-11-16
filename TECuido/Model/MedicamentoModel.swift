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

extension MedicamentoModel  {
    public static var defaultMedicamento1 =  MedicamentoModel(id: 1, nombre: "Aspirina", dosis: 2, unidadDosis: "tabletas", frecuencia: 8, unidadFrecuencia: "horas", duracion: 3, unidadDuracion: "días")
    public static var defaultMedicamento2 = MedicamentoModel(id: 2, nombre: "Paracetamol", dosis: 3, unidadDosis: "pastillas", frecuencia: 6, unidadFrecuencia: "horas", duracion: 1, unidadDuracion: "semana")
}
