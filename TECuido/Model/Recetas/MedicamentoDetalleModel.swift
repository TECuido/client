//
//  MedicamentoDetalleModel.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import Foundation

struct MedicamentoDetalleModel: Decodable, Identifiable {
    var id: Int
    var nombre: String
    var uso: String
    var descripcion: String
}


extension MedicamentoDetalleModel  {
    public static var defaultMedicamento =  MedicamentoDetalleModel(id: 1, nombre: "Aspirina", uso: "Aliviar el dolor, la fiebre y la inflamación", descripcion: "La aspirina pertenece a un grupo de medicamentos llamados antiinflamatorios no esteroides (AINE). Actúa bloqueando ciertas sustancias en el cuerpo que causan dolor, fiebre e inflamación.")
}
