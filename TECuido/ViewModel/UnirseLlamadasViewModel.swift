//
//  UnirseLlamadasViewModel.swift
//  TECuido
//
//  Created by Alumno on 09/11/23.
//

import Foundation

class UnirseLlamadasViewModel: ObservableObject {
    
    var codigo: String = ""
    @Published var codigoError: Int =  0
    @Published var error: String = ""
    @Published var showLlamadaView: Bool = false
    @Published var llamada = DataLlamadaModel.defaultLlamada
    
    @Published var token = ""
    
    @Published var failedAuthentication: Bool = false

    
    public func getLlamada() async {
        
        codigoError = 0
        error = ""
        
        do {
            
            if(codigo.isEmpty){
                codigoError = 1
                throw ValidationError.error(description: "Debes ingresar un código para la llamada")
            }
                      
            if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
                
                let result : Result<APIResponseModel<DataLlamadaModel>, NetworkError> = await Webservice().getRequest("/llamadas/\(codigo)")
                
                switch result {
                    case .success(let data):
                    if let data = data.data {
                        if(data.idUsuarioReceptor == tokens.id){
                            DispatchQueue.main.async {
                                self.llamada = data
                            }
                            //await getToken()
                        } else {
                            DispatchQueue.main.async {
                                self.error = "No puedes acceder a esta llamada"
                            }
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
                            DispatchQueue.main.async {
                                self.error = message
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
            
        } catch ValidationError.error(let description){
            DispatchQueue.main.async {
                self.error = description
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func getToken() async {
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            let result : Result<APIResponseModel<LlamadaTokenModel>, NetworkError> = await Webservice().getRequest("/llamadas/usuario/\(tokens.id)/token")
                        
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.token = data.data!.token
                        self.showLlamadaView = true
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
