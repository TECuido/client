//
//  GrupoDetailViewModel.swift
//  TECuido
//
//  Created by Alumno on 26/10/23.
//
import Foundation

class GrupoDetailViewModel: ObservableObject {
    
    @Published var miembros: [MiembroGrupoModel] = []
    @Published var failedAuthentication: Bool = false
    
    public func getMiembros(idGrupo: Int) async {
                
        let result : Result<APIResponseModel<[MiembroGrupoModel]>, NetworkError> = await Webservice.instance.getRequest("/grupos/\(idGrupo)/usuarios/")
        
        switch result {
        case .success(let data):
            DispatchQueue.main.async {
                self.miembros = data.data!
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }

}



