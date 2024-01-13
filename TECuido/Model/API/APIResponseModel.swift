//
//  APIResponseModel.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import Foundation

class APIResponseModel<T: Decodable> : Decodable {
    var message: String?
    var data: T?
}
