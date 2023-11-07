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
    
    @Published var dataEmergencia = DataEmergenciaGrupoModel.defaultEmergencia
    @Published var showEstatusView = false

    
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
    
    public func addEmergencia() async {
        
        //obetener tokens
        let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
        
        //obtener el grupo seleccionado a partir del nombre
        let i = grupos.firstIndex {
            $0.nombre == selectedOptionContacto
        }
        let selectedGrupo = grupos[i!]
        
        //obetener descripcion
        let descripcion = isNivelGravedadSelected ? "Nivel de gravedad: \(nivel)" : descripcion
        
        //agregar los datos de ubicación
        
        let data: EmergenciaGrupoModel
        
        if(descripcion.count > 0){
            data = EmergenciaGrupoModel(tipo: selectedMotivo, descripcion: descripcion, idEmisor: tokens.id, idGrupo: selectedGrupo.id)
        } else {
            data = EmergenciaGrupoModel(tipo: selectedMotivo, idEmisor: tokens.id, idGrupo: selectedGrupo.id)
        }
        
        
        
        let result : Result<APIResponseModel<DataEmergenciaGrupoModel>, NetworkError> = await Webservice().postRequest("/emergencias/grupo", with: data)
        
        
        switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.dataEmergencia = data.data!
                    self.showEstatusView = true
                }
            case .failure(let error):
                switch error {
                case .badStatus(let error, let message):
                    print(error.self)
                default:
                    print(error.self)
                    print(error.localizedDescription)
                }
            
        }
        
    }

}


