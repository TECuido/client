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
    @Published var isShowingConfirmationModel = false
    @Published var recetaEliminada = false
    @Published var idRecetaSeleccionada = -1

        
    public func getRecetasPaciente() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            let result : Result<APIResponseModel<[RecetaModel]>, NetworkError> = await Webservice.instance.getRequest("/recetas/usuario/\(tokens.id)")
            
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.recetas = data.data!
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
        
    public func getRecetasMedico() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            let result : Result<APIResponseModel<[RecetaModel]>, NetworkError> = await Webservice.instance.getRequest("/recetas/medico/\(tokens.id)")
            
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.recetas = data.data!
                    }
                case .failure(let error):
                    print(error.localizedDescription)

            }
        }
    }
    
    public func deleteRecetas() async {
        let result : Result<APIResponseModel<RecetaModel>, NetworkError> = await Webservice.instance.deleteRequest("/recetas/\(idRecetaSeleccionada)")
        
        switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.recetaEliminada = true
                }
            case .failure(let error):
                print(error.localizedDescription)

        }
    }
    
    
}

