//
//  MedicamentoDetalleViewModel.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import Foundation

class MedicamentoDetalleViewModel: ObservableObject {
    
    @Published var medicamentoDetalle = MedicamentoDetalleModel.defaultMedicamento
    
    public func getDetalle() async {
                
        let result : Result<APIResponseModel<MedicamentoDetalleModel>, NetworkError> = await Webservice().getRequest("/medicamento/detalle/\(0)")
        
        switch result {
            case .success(let data):
            if let data = data.data {
                DispatchQueue.main.async {
                    self.medicamentoDetalle = data

                }
            }
            case .failure(let error):
                print(error.self)
                print(error.localizedDescription)
        }
    }

}

