//
//  RecetaViewModel.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import Foundation
import SwiftUI

class RecetaViewModel : ObservableObject {
    

    @Published var ejemplo: [RecetaModel] = [
        RecetaModel.defaultReceta,
        RecetaModel.defaultReceta1,
        RecetaModel.defaultReceta2,
        RecetaModel.defaultReceta3
       
        
    ]
    
   
    
}
