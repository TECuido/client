//
//  EditarEmergenciaViewModel.swift
//  TECuido
//
//  Created by Alumno on 15/01/24.
//

import Foundation

class EditarEmergenciaViewModel: ObservableObject {
    
    @Published var selectedMotivo = "Médica"
    @Published var selectedIcon: String = "questionmark.circle.fill"
    
    @Published var motivos = [
        "Médica",
        "Acoso",
        "Incendio",
        "Accidente de tráfico",
        "Desastre natural",
        "Secuestro",
        "Extorsión",
        "Emergencia tecnológica"
    ]

    @Published var motivoIconMapping: [String: String] = [
        "Médica": "heart.circle.fill",
        "Acoso": "exclamationmark.triangle.fill",
        "Secuestro": "bolt.horizontal.circle.fill",
        "Desastre natural": "tornado",
        "Incendio":"flame.fill",
        "Accidente de tráfico":"car.fill",
        "Extorsión":"hand.raised.fill",
        "Emergencia tecnológica":"antenna.radiowaves.left.and.right"
    ]
    
    @Published var selectedOptionContacto: String = "Todos mis contactos"
    @Published var grupos: [GrupoModel] = [GrupoModel.example]
    @Published var gruposNombres: [String] = ["Todos mis contactos"]
    
    @Published var isNivelGravedadSelected = false
    @Published var nivel: String = "1"
    @Published var descripcion: String = ""
    
    @Published var dataEmergencia = DataEmergenciaModel.defaultEmergencia
    @Published var emergenciaEditada = false
    
    @Published var locationManager = LocationManager()
    
    @Published var idEmergencia = -1
    
    
    public func getGrupos() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            
            
            let result : Result<APIResponseModel<[GrupoModel]>, NetworkError> = await Webservice().getRequest("/grupos/usuario/\(tokens.id)")
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.grupos = data.data!
                    if(self.grupos.count > 0){
                        self.gruposNombres = ["Todos mis contactos"] + self.grupos.map{
                            $0.nombre
                        }
                        self.selectedOptionContacto = self.gruposNombres[0]
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    public func editEmergencia() async {
        
        //agregar los datos de ubicación
        let longitud = locationManager.lastLocation?.longitude
        let latitud = locationManager.lastLocation?.latitude
    
        let descripcionRequest = isNivelGravedadSelected ? "Nivel de emergencia \(nivel)" : descripcion
        
        let result : Result<APIResponseModel<DataEmergenciaModel>, NetworkError>
        
        //obetener tokens
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            
            if(selectedOptionContacto != "Todos mis contactos"){
                
                //obtener el grupo seleccionado a partir del nombre
                let i = grupos.firstIndex {
                    $0.nombre == selectedOptionContacto
                }
                let selectedGrupo = grupos[i!]
                
                let data = EmergenciaGrupoModel(
                    tipo: selectedMotivo,
                    descripcion: descripcionRequest,
                    idEmisor: tokens.id,
                    idGrupo: selectedGrupo.id,
                    longitud: (longitud != nil) ? Float(longitud!) : nil,
                    latitud: (latitud != nil) ? Float(latitud!) : nil
                )
                
                result = await Webservice().putRequest("/emergencias/\(idEmergencia)/grupo", with: data)
            } else {
                let data = EmergenciaContactosModel(
                    tipo: selectedMotivo,
                    descripcion: descripcionRequest,
                    idEmisor: tokens.id,
                    longitud: (longitud != nil) ? Float(longitud!) : nil,
                    latitud: (latitud != nil) ? Float(latitud!) : nil
                )
                
                result = await Webservice().putRequest("/emergencias/\(idEmergencia)/allgrupo", with: data)
            }
            
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.dataEmergencia = data.data!
                    self.emergenciaEditada = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
