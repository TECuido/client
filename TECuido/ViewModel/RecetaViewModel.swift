//
//  RecetaViewModel.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

class RecetaViewModel: ObservableObject {
    
    @Published var recetaMedicamentos = [MedicamentoModel.defaultMedicamento1, MedicamentoModel.defaultMedicamento2]
    
    public func getMedicamentos() async {
                
        let result : Result<APIResponseModel<[MedicamentoModel]>, NetworkError> = await Webservice().getRequest("/recetas/\(0)")
        
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
