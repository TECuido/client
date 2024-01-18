//
//  MandarEmergenciaViewModel.swift
//  TECuido
//
//  Created by Julio on 06/11/23.
//

import Foundation

class MandarEmergenciaViewModel: ObservableObject {
    
    
    @Published var selectedMotivo = "Médica"
    
    @Published var selectedOptionContacto: String = "Todos mis contactos"
    @Published var grupos: [GrupoModel] = [GrupoModel.example]
    @Published var gruposNombres: [String] = ["Todos mis contactos"]
    
    //  Seleccion de boton
    @Published var isMedicaSelected = false
    @Published var isAcosoSelected = false
    @Published var isSecuestroSelected = false
    @Published var isDesastreSelected = false
    @Published var isIncendioSelected = false
    @Published var isTraficoSelected = false
    @Published var isExtorsionSelected = false
    @Published var isTecnologicaSelected = false
    
    @Published var descripcion: String = ""
    
    @Published var dataEmergencia = DataEmergenciaModel.defaultEmergencia
    @Published var showEstatusView = false
    
    @Published var locationManager = LocationManager()
    
    
    public func getGrupos() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            
            
            let result : Result<APIResponseModel<[GrupoModel]>, NetworkError> = await Webservice.instance.getRequest("/grupos/usuario/\(tokens.id)")
            
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
    
    public func addEmergencia() async {
                
        //agregar los datos de ubicación
        let longitud = locationManager.lastLocation?.longitude
        let latitud = locationManager.lastLocation?.latitude
        
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
                    descripcion: descripcion.count > 0 ? descripcion : nil,
                    idEmisor: tokens.id,
                    idGrupo: selectedGrupo.id,
                    longitud: (longitud != nil) ? Float(longitud!) : nil,
                    latitud: (latitud != nil) ? Float(latitud!) : nil
                )
                
                
                result = await Webservice.instance.postRequest("/emergencias/grupo", with: data)
            } else {
                let data = EmergenciaContactosModel(
                    tipo: selectedMotivo,
                    descripcion: descripcion.count > 0 ? descripcion : nil,
                    idEmisor: tokens.id,
                    longitud: (longitud != nil) ? Float(longitud!) : nil,
                    latitud: (latitud != nil) ? Float(latitud!) : nil
                )
                
                result = await Webservice.instance.postRequest("/emergencias/allgrupo", with: data)
            }
            
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.dataEmergencia = data.data!
                    self.showEstatusView = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    public func updateSelectedMotivo(motivo: TipoEmergencia) {
        // Restablecer todas las selecciones
        resetSelectedMotivos()
        
        // Actualizar motivo y descripción según el motivo seleccionado
        selectedMotivo = motivo.rawValue
        
        switch motivo {
        case .Medica:
            isMedicaSelected = true
            descripcion = "He tenido una emergencia médica, por favor ven a ayudarme"
        case .Acoso:
            isAcosoSelected = true
            descripcion = "Ayúdame, me están acosando, ven pronto"
        case .Secuestro:
            isSecuestroSelected = true
            descripcion = "Estoy teniendo un intento de secuestro"
        case .Desastre:
            isDesastreSelected = true
            descripcion = "Ha sucedido un desastre natural"
        case .Incendio:
            isIncendioSelected = true
            descripcion = "Está sucediendo un incendio"
        case .Trafico:
            isTraficoSelected = true
            descripcion = "He tenido un accidente de tráfico, ven a ayudarme"
        case .Extorsion:
            isExtorsionSelected = true
            descripcion = "Estoy siendo víctima de una extorsión"
        case .Tecnologica:
            isTecnologicaSelected = true
            descripcion = "He tenido una emergencia tecnológica, por favor ven a ayudarme"
        }
    }
        
    // Restablecer todas las selecciones
    public func resetSelectedMotivos() {
        isMedicaSelected = false
        isAcosoSelected = false
        isSecuestroSelected = false
        isDesastreSelected = false
        isIncendioSelected = false
        isTraficoSelected = false
        isExtorsionSelected = false
        isTecnologicaSelected = false
    }


}


