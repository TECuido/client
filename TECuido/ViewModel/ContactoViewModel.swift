//
//  ContactoViewModel.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import Foundation
import SwiftUI

class ContactoViewModel : ObservableObject {
    

    @Published var ejemplo: [UsuarioModel] = [
        UsuarioModel.defaultUsuario,
        UsuarioModel.defaultUsuario2,
        UsuarioModel.defaultUsuario3
       
        
    ]
    
   
    
}
