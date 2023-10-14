//
//  APIResponseModel.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import Foundation
// Modelo debe ir en mayuscula
struct ApiResponseModel : Decodable{
    var message : String
    var data : String?
}
