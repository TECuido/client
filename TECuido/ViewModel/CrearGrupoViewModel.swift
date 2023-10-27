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
    @Published var selectedIndices: [Int] = []
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
                throw ValidationError.error(description: "Debes ingresar el nombre del grupo")
            }
            
            if(selectedIndices.isEmpty){
                throw ValidationError.error(description: "Debes agregar al menos un contacto")
            }
            
            nombreError = 0
            error = ""
            
            let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
            let data = AgregarGrupoModel(nombre: nombreGrupo, idCreador: tokens.id)
            let result : Result<APIResponseModel<GrupoAgregadoModel>, NetworkError> = await Webservice().postRequest("/grupos", with: data)
                        
            
            switch result {
                case .success(let data):
                for index in selectedIndices {
                    try await addMiembros(idMiembro: contactos[index].usuarioAgregado.id, idGrupo: data.data!.idGrupo)
                }
                DispatchQueue.main.async {
                    self.grupoCreado = true
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
            DispatchQueue.main.async {
                self.error = "Ocurrió un error"
            }
        }
    }
    
    
    public func addMiembros(idMiembro: Int, idGrupo: Int) async throws {
            
        let data = AgregarMiembroModel(idMiembro: idMiembro, idGrupo: idGrupo)
        let result : Result<APIResponseModel<MiembroAgregadoModel>, NetworkError> = await Webservice().postRequest("/grupos/usuario", with: data)
        
        switch result {
            case .success(let data):
                return
            case .failure(let error):
                throw error
        }
            
            
            
        
    }
    
    
    
}
