//
//  MiembroGrupoModel.swift
//  TECuido
//
//  Created by Alumno on 26/10/23.
//

import Foundation

struct MiembroGrupoModel : Decodable, Identifiable{
    var id = UUID()
    var miembroGrupo: ContactoModel
    
    enum CodingKeys: String, CodingKey {
        case miembroGrupo
    }
    
}

extension MiembroGrupoModel {
    // Asi se agrega un usuario default
    public static var defaultMiembro : MiembroGrupoModel{
        return MiembroGrupoModel(miembroGrupo: ContactoModel.defaultContacto);
    }
   
}
