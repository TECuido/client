//
//  ContactoEmergenciaViewModel.swift
//  TECuido
//
//  Created by Alumno on 16/01/24.
//


import Foundation
import SwiftUI

class ContactoEmergenciaViewModel : ObservableObject {
    
    @Published var nombre: String = ""
    @Published var correo: String = ""
    @Published var telefono: String = ""

    @Published var nombreError: Int =  0
    @Published var telefonoError: Int =  0
    @Published var correoError: Int =  0
    
    @Published var error: String = ""
    
    @Published var addedContacto: Bool = false
    
    public func addContactoEmergencia() async {
        
        do {
            
            if(nombre.isEmpty){
                DispatchQueue.main.async {
                    self.telefonoError = 0
                    self.correoError = 0
                    self.nombreError = 1
                }
                throw ValidationError.error(description: "Debes ingresar el nombre del contacto")
            }
            
            if(telefono.isEmpty){
                DispatchQueue.main.async {
                    self.telefonoError = 1
                    self.correoError = 0
                    self.nombreError = 0
                }
                throw ValidationError.error(description: "Debes ingresar el teléfono del contacto")
            }
            
            if(correo.isEmpty){
                DispatchQueue.main.async {
                    self.telefonoError = 0
                    self.correoError = 1
                    self.nombreError = 0
                }
                throw ValidationError.error(description: "Debes ingresar el correo")
            }
            
            //checar que el email sea válido en caso de agregarlo
            if(!isValidEmail(email: correo)){
                DispatchQueue.main.async {
                    self.telefonoError = 0
                    self.correoError = 1
                    self.nombreError = 0
                }
                throw ValidationError.error(description: "Correo inválido")
            }
            
            //checar que el teléfono sea válido
            if(!isValidTelefono(telefono: telefono)){
                DispatchQueue.main.async {
                    self.nombreError = 0
                    self.correoError = 0
                    self.telefonoError = 1
                }
                throw ValidationError.error(description: "Ingresa el teléfono en formato de 10 números")
            }
            
            DispatchQueue.main.async {
                self.correoError = 0
                self.nombreError = 0
                self.telefonoError = 0
                self.error = ""
            }
            
            if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
                
                var data = ContactoEmergenciaInicioModel(
                    nombre: nombre,
                    telefono: telefono,
                    esContactoEmergencia: true
                )
                
                if(!correo.isEmpty){
                    data.correo = correo
                }
                
                let result : Result<APIResponseModel<[ContactoEmergeciaDetallesResponseModel]>, NetworkError> = await Webservice.instance.postRequest("/contactos/usuario/\(tokens.id)", with: data)
                switch result {
                    case .success(_):
                        DispatchQueue.main.async {
                            self.addedContacto = true
                        }
                    case .failure(let error):
                        switch error {
                            case .badStatus(_, let message):
                                DispatchQueue.main.async {
                                    self.error = message
                                }
                            default:
                                print(error.localizedDescription)
                        }
                    
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
