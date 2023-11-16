//
//  LlamadaModel.swift
//  TECuido
//
//  Created by Alumno on 09/11/23.
//

import Foundation

struct CrearLlamadaModel : Codable {
    var idUsuarioReceptor: Int
}

struct DataLlamadaModel: Decodable {
    var idLlamada: String
    var idUsuarioReceptor: Int
    var idUsuarioEmisor: Int
}

struct LlamadaTokenModel: Decodable {
    var token: String
}
extension LlamadaTokenModel {
    public static var defaultToken = ""
}

extension DataLlamadaModel  {
    public static var defaultLlamada = DataLlamadaModel(idLlamada: "", idUsuarioReceptor: 1, idUsuarioEmisor: 2)
}
