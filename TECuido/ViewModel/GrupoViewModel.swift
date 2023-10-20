//
//  GrupoViewModel.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import Foundation

class GrupoViewModel: ObservableObject {
    @Published var grupos: [GrupoModel] = GrupoModel.exampleList 
    
    func getGrupos() async {
        
    }

}

