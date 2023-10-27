//
//  RecetaDetalleViewModel.swift
//  TECuido
//
//  Created by Alumno on 27/10/23.
//

import Foundation


import Foundation
import SwiftUI

class RecetaDetalleViewModel : ObservableObject {
    

    @Published var ejemplo: [RecetaDetalleModel] = [
        RecetaDetalleModel.defaultReceta,
        RecetaDetalleModel.defaultReceta1,
        RecetaDetalleModel.defaultReceta2,
        RecetaDetalleModel.defaultReceta3
       
        
    ]
    
   
    
}

