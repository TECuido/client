//
//  RecetaViewModel.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

class RecetaViewModel: ObservableObject {
    
    @Published var recetaMedicamentos = MedicamentoRecetaModel.defaultMedicamento1    
    @Published var failedAuthentication: Bool = false

    
    public func getMedicamentos(idReceta: Int) async {
                
        let result : Result<APIResponseModel<MedicamentoRecetaModel>, NetworkError> = await Webservice().getRequest("/medicamentos/receta/\(idReceta)")
        
        switch result {
            case .success(let data):
            if let data = data.data {
                DispatchQueue.main.async {
                    self.recetaMedicamentos = data
                }
            }
            case .failure(let error):
                switch error {
                    case .badStatus(let error, let message):
                        if(error == 401){
                            DispatchQueue.main.async {
                                self.failedAuthentication = true
                            }
                        }
                    default:
                        print(error.self)
                        print(error.localizedDescription)
                }
        }
    }

}
