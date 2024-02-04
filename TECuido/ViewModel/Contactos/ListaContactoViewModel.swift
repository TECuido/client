//
//  ContactoViewModel.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import Foundation
import SwiftUI

class ListaContactoViewModel : ObservableObject {
    
    @Published var contactos: [ContactoModel] = []
    @Published var idContacto: Int = -1
    @Published var isShowingConfirmationModel: Bool = false
    
    @Published var borrado: Bool = false
    
    public func getContactos() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {
            
            let result : Result<APIResponseModel<[ContactoModel]>, NetworkError> = await Webservice.instance.getRequest("/contactos/usuario/\(tokens.id)")
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.contactos = data.data!
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    public func deleteContactos() async {
                    
        let result : Result<APIResponseModel<ContactoModel>, NetworkError> = await Webservice.instance.deleteRequest("/contactos/\(idContacto)")
    
        switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.borrado = true
                }
            case .failure(let error):
                print(error.localizedDescription)
        }
            
        
    }
        
}
    
