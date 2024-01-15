//
//  RecetaViewModel.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

class RecetaViewModel: ObservableObject {
    
    @Published var recetaMedicamentos = MedicamentoRecetaModel(medicamentoReceta: [])
    
    public func getMedicamentos(idReceta: Int) async {
        
        print(recetaMedicamentos)
                
        let result : Result<APIResponseModel<MedicamentoRecetaModel>, NetworkError> = await Webservice().getRequest("/medicamentos/receta/\(idReceta)")
        
        switch result {
            case .success(let data):
            if let data = data.data {
                DispatchQueue.main.async {
                    print(data)
                    self.recetaMedicamentos = data
                }
            }
            case .failure(let error):
                print(error.localizedDescription)

        }
    }

}
