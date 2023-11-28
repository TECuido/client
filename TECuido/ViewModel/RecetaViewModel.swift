//
//  RecetaViewModel.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

class RecetaViewModel: ObservableObject {
    
    @Published var recetaMedicamentos = MedicamentoRecetaModel.defaultMedicamento1
    
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
                print(error.self)
                print(error.localizedDescription)
        }
    }

}
