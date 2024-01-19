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
            descripcion = "¡Emergencia médica! Necesito ayuda. Por favor, llama a los servicios de emergencia y dirígete a mi ubicación."
        case .Acoso:
            isAcosoSelected = true
            descripcion =
            "¡Peligro! Necesito ayuda inmediata. Llama a la policía y ven a donde estoy."
        case .Secuestro:
            isSecuestroSelected = true
            descripcion = "¡Secuestro! Necesito ayuda inmediata. Llama a la policía y comparte mi ubicación. Esta es una emergencia, por favor, actúa rápidamente."
        case .Desastre:
            isDesastreSelected = true
            descripcion = "¡Desastre natural! Necesito asistencia urgente. Comunica a las autoridades y a mis contactos sobre la situación y mi ubicación. Por favor, actúa rápidamente."
        case .Incendio:
            isIncendioSelected = true
            descripcion = "¡Incendio! Necesito ayuda urgente. Llama a los servicios de emergencia. Proporcionaré mi ubicación. Actúa con rapidez, por favor."
        case .Trafico:
            isTraficoSelected = true
            descripcion = "¡Accidente de tráfico! He tenido un accidente. Llama a emergencias y ven a mi ubicación lo más pronto posible."
        case .Extorsion:
            isExtorsionSelected = true
            descripcion = "¡Extorsión en curso! Necesito ayuda inmediata. Por favor, contacta a la policía para informarles sobre la situación. Actúa con urgencia."
        case .Tecnologica:
            isTecnologicaSelected = true
            descripcion = "¡Emergencia tecnológica! Se ha producido un fallo grave o ciberataque. Necesito ayuda especializada. Por favor, contacta a los servicios de tecnología de emergencia y notifica a mis contactos sobre la situación."
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


