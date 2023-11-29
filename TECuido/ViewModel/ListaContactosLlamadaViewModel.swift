//
//  ListaContactosLlamadaViewModel.swift
//  TECuido
//
//  Created by Alumno on 30/10/23.
//

import Foundation

class ListaContactosLlamadaViewModel: ObservableObject {
    
    @Published var contactos: [ContactoModel] = []
    @Published var selected = 0
    @Published var llamada = DataLlamadaModel.defaultLlamada
    @Published var showLlamadaView = false
    
    @Published var failedAuthentication: Bool = false

    @Published var token = ""
    
    public func getContactos() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            
            let result : Result<APIResponseModel<[ContactoModel]>, NetworkError> = await Webservice().getRequest("/contactos/usuario/\(tokens.id)")
            
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.contactos = data.data!
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
            
        } else {
            DispatchQueue.main.async {
                self.failedAuthentication = true
            }
        }
        
        
    }
    
    public func createCall() async {
        let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
        let selectedUsuario = contactos[selected]
        print(selectedUsuario)
        let data = CrearLlamadaModel(idUsuarioReceptor: selectedUsuario.usuarioAgregado.id)
        let result : Result<APIResponseModel<DataLlamadaModel>, NetworkError> = await Webservice().postRequest("/llamadas/usuario/\(tokens.id)", with: data)
                    
        switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.llamada = data.data!
                }
                //await getToken()
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
    
    public func getToken() async {
        let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
        let result : Result<APIResponseModel<LlamadaTokenModel>, NetworkError> = await Webservice().getRequest("/llamadas/usuario/\(tokens.id)/token")
                    
        switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.token = data.data!.token
                    self.showLlamadaView = true
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
