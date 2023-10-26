//
//  CrearGrupoViewModel.swift
//  TECuido
//
//  Created by Alumno on 26/10/23.
//

import Foundation


class CrearGrupoViewModel: ObservableObject {
    var nombreGrupo: String = ""
    @Published var contactos: [ContactoModel] = []
    @Published var nombreError: Int =  0
    @Published var error: String = ""
    @Published var grupoCreado: Bool = false
    
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

    
    public func crearGrupo() async {
        do {
            
            if(nombreGrupo.isEmpty){
                nombreError = 1
                throw ValidationError.error(description: "Debes ingresar el correo del contacto")
            }
            
            nombreError = 0
            error = ""
            
            
            
        } catch ValidationError.error(let description){
            DispatchQueue.main.async {
                self.error = description
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    
}
