//
//  ListaContactosLlamadaViewModel.swift
//  TECuido
//
//  Created by Alumno on 30/10/23.
//

import Foundation

class ListaContactosLlamadaViewModel: ObservableObject {
    
    @Published var contactos: [ContactoModel] = []
    
    public func getContactos() async {
        
        let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
        
        let result : Result<APIResponseModel<[ContactoModel]>, NetworkError> = await Webservice().getRequest("/contactos/usuario/\(tokens.id)")
        
        switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.contactos = data.data!
                }
            case .failure(let error):
            print(error.self)
                print(error.localizedDescription)
        }
    }
    
}
