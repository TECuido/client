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
        UsuarioModel.defaultUsuario3,
        UsuarioModel.defaultUsuario4,
        UsuarioModel.defaultUsuario5,
        UsuarioModel.defaultUsuario6,
        UsuarioModel.defaultUsuario7,
        UsuarioModel.defaultUsuario8,
        UsuarioModel.defaultUsuario9,
        UsuarioModel.defaultUsuario10,
        UsuarioModel.defaultUsuario11,
        UsuarioModel.defaultUsuario12
        
    ]
    
   
    
}
