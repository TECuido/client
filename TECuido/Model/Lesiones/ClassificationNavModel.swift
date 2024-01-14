//
//  ClassificationNavModel.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import Foundation
import CoreML

struct ClassificationNavModel: Hashable {
    var data: String
    var model: MLModel
}
