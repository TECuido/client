//
//  ContactoViewModel.swift
//  TECuido
//
//  Created by Alumno on 25/10/23.
//


import Foundation
import SwiftUI

class ContactoViewModel : ObservableObject {
    
    var correo: String = ""
    
    @Published var correoError: Int =  0
    @Published var error: String = ""
    @Published var addedContacto: Bool = false
    
    public func addContacto() async {
        
        do {
            
            if(correo.isEmpty){
                correoError = 1
                throw ValidationError.error(description: "Debes ingresar el correo del contacto")
            }
            
            correoError = 0
            error = ""
            
            let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
            let data = AgregarContactoModel(correo: correo)
            
            let result : Result<APIResponseModel<[ContactoAgregadoModel]>, NetworkError> = await Webservice().postRequest("/contactos/usuario/\(tokens.id)", with: data)
            
            
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.addedContacto = true
                    }
                case .failure(let error):
                    switch error {
                    case .badStatus(let error, let message):
                        DispatchQueue.main.async {
                            self.error = message
                        }
                    default:
                        print(error.self)
                        print(error.localizedDescription)
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
    
}
    
