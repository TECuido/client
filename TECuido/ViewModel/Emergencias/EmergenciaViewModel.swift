//
//  EmergenciaViewModel.swift
//  TECuido
//
//  Created by Alumno on 08/11/23.
//

import Foundation

class EmergenciaViewModel: ObservableObject {
    
    @Published var emergencia = DataEmergenciaModel.defaultEmergencia
    @Published var hayEmergencia = false
    
    public func getEmergencia() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            let result : Result<APIResponseModel<DataEmergenciaModel>, NetworkError> = await Webservice.instance.getRequest("/emergencias/receptor/\(tokens.id)")
            switch result {
                case .success(let data):
                if let data = data.data {
                    DispatchQueue.main.async {
                        self.emergencia = data
                        self.hayEmergencia = true
                    }
                } else {
                    DispatchQueue.main.async {
                        self.hayEmergencia = false
                    }
                }
                case .failure(let error):
                    print(error.localizedDescription)

            }
        }        
        
    }

}
