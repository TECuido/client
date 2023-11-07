//
//  MandarEmergenciaViewModel.swift
//  TECuido
//
//  Created by Julio on 06/11/23.
//

import Foundation

class MandarEmergenciaViewModel: ObservableObject {
    
    
    @Published var selectedMotivo = "Médica"
    @Published var motivos = ["Médica", "Desastre natural","Incendio","Accidente de tráfico","Acoso","Secuestro", "Extorsión","Emergencia tecnológica"]
    
    @Published var selectedOptionContacto: String = ""
    @Published var grupos: [GrupoModel] = [GrupoModel.example]
    @Published var gruposNombres: [String] = ["Familia"]
    
    @Published var isNivelGravedadSelected = false
    @Published var nivel: Int = 1
    @Published var descripcion: String = ""

    
    public func getGrupos() async {
        
        let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
        
        let result : Result<APIResponseModel<[GrupoModel]>, NetworkError> = await Webservice().getRequest("/grupos/usuario/\(tokens.id)")
        
        switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.grupos = data.data!
                    if(self.grupos.count > 0){
                        self.gruposNombres = self.grupos.map{
                            $0.nombre
                        }
                        self.selectedOptionContacto = self.gruposNombres[0]
                    }
                }
            case .failure(let error):
            print(error.self)
                print(error.localizedDescription)
        }
    }

}


