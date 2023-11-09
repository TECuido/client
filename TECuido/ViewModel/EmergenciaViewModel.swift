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
    
    public func getEmergencia() async {
        
        let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
        
        let result : Result<APIResponseModel<DataEmergenciaGrupoModel>, NetworkError> = await Webservice().getRequest("/emergenc ias/receptor/\(tokens.id)")
        
        switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.emergencia = data.data!
                    if(data.data != nil){
                        self.hayEmergencia = true
                    }
                }
            case .failure(let error):
            print(error.self)
                print(error.localizedDescription)
        }
    }

}
