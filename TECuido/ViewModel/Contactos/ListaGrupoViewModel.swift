//
//  GrupoViewModel.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import Foundation

class ListaGrupoViewModel: ObservableObject {
    
    @Published var grupos: [GrupoModel] = []
    @Published var grupoSeleccionado = GrupoModel.example
    
    public func getGrupos() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            
            let result : Result<APIResponseModel<[GrupoModel]>, NetworkError> = await Webservice.instance.getRequest("/grupos/usuario/\(tokens.id)")
            
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.grupos = data.data!
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
        
    }
    
    public func deleteGrupo() async {
        let idGrupo = self.grupoSeleccionado.id
        let result : Result<APIResponseModel<GrupoModel>, NetworkError> = await Webservice.instance.deleteRequest("/grupos/\(idGrupo)")
        switch result {
        case .success(let data):
            print(data)
        case .failure(let error):
            print(error)
        }
    }

}
