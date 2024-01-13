//
//  EmergenciaViewModel.swift
//  TECuido
//
//  Created by Alumno on 08/11/23.
//

import Foundation

class EmergenciaViewModel: ObservableObject {
    
    @Published var emergencia = DataEmergenciaGrupoModel.defaultEmergencia
    @Published var hayEmergencia = false
    
    @Published var failedAuthentication: Bool = false

    
    public func getEmergencia() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            let result : Result<APIResponseModel<DataEmergenciaGrupoModel>, NetworkError> = await Webservice().getRequest("/emergencias/receptor/\(tokens.id)")
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
                    switch error {
                        case .badStatus(let error, _):
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
        } else {
            DispatchQueue.main.async {
                self.failedAuthentication = true
            }
        }
        
        
    }

}
