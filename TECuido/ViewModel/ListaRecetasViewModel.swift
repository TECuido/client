//
//  RecetaViewModel.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import Foundation
import SwiftUI

class ListaRecetasViewModel : ObservableObject {
    

    @Published var recetas: [RecetaModel] = []
        
    public func getRecetas() async {
        
        let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
        
        let result : Result<APIResponseModel<[RecetaModel]>, NetworkError> = await Webservice().getRequest("/recetas/usuario/\(tokens.id)")
        
        switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.recetas = data.data!
                }
            case .failure(let error):
                print(error.self)
                print(error.localizedDescription)
        }
    }
    
   
    
}

