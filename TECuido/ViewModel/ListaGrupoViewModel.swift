//
//  GrupoViewModel.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import Foundation

class ListaGrupoViewModel: ObservableObject {
    
    @Published var grupos: [GrupoModel] = [GrupoModel.example]
    @Published var grupoSeleccionado = GrupoModel.example
    
    public func getGrupos() async {
        
        let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
        
        let result : Result<APIResponseModel<[GrupoModel]>, NetworkError> = await Webservice().getRequest("/grupos/usuario/\(tokens.id)")
        
        switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.grupos = data.data!
                }
            case .failure(let error):
            print(error.self)
                print(error.localizedDescription)
        }
    }
    
    public func deleteGrupo() async {
            let idGrupo = self.grupoSeleccionado.id
            let result : Result<APIResponseModel<GrupoModel>, NetworkError> = await Webservice().deleteRequest("/grupos/\(idGrupo)")
            switch result {
            case .success(let data):
                print(data)
                //return
            case .failure(let error):
                print(error)
            }
        }

}




