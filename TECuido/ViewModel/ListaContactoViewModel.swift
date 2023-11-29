//
//  ContactoViewModel.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import Foundation
import SwiftUI

class ListaContactoViewModel : ObservableObject {
    
    
    @Published var ejemplo: [ContactoModel] = []
    @Published var idAgregado: Int = -1
    @Published var isShowingConfirmationModel: Bool = false
    @Published var borrado: Bool = false
    @Published var failedAuthentication: Bool = false

    
    public func getContactos() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {
            
            let result : Result<APIResponseModel<[ContactoModel]>, NetworkError> = await Webservice().getRequest("/contactos/usuario/\(tokens.id)")
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.ejemplo = data.data!
                }
            case .failure(let error):
                print(error.self)
                print(error.localizedDescription)
            }
        } else {
            DispatchQueue.main.async {
                self.failedAuthentication = true
            }
        }
    }
    
    public func deleteContactos() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            
            let result : Result<APIResponseModel<ContactoModel>, NetworkError> = await Webservice().deleteRequest("/contactos/\(tokens.id)/\(idAgregado)")
        
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.borrado = true
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
}
    
