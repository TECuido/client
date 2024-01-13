//
//  MandarEmergenciaViewModel.swift
//  TECuido
//
//  Created by Julio on 06/11/23.
//

import Foundation

class MandarEmergenciaViewModel: ObservableObject {
    
    
    @Published var selectedMotivo = "Médica"
    @Published var motivos = ["Médica", "Acoso", "Incendio", "Accidente de tráfico", "Desastre natural", "Secuestro", "Extorsión","Emergencia tecnológica"]
    
    @Published var selectedIcon: String = "questionmark.circle.fill"
    @Published var motivoIconMapping: [String: String] = [
         "Médica": "heart.circle.fill",
         "Acoso": "exclamationmark.triangle.fill",
         "Secuestro": "bolt.horizontal.circle.fill",
         "Desastre natural": "tornado",
         "Incendio":"flame.fill",
         "Accidente de tráfico":"car.fill",
         "Extorsión":"hand.raised.fill",
         "Emergencia tecnológica":"antenna.radiowaves.left.and.right"]
    
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
    
    @Published var isNivelGravedadSelected = false
    @Published var nivel: Int = 1
    @Published var descripcion: String = ""
    
    @Published var dataEmergencia = DataEmergenciaGrupoModel.defaultEmergencia
    @Published var showEstatusView = false
    
    @Published var locationManager = LocationManager()
    
    @Published var failedAuthentication: Bool = false
    
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
                    switch error {
                    case .badStatus(let error, _):
                            if(error == 401){
                                DispatchQueue.main.async {
                                    self.failedAuthentication = true
                                }
                            }
                        default:
                            print(error.self)
                            print(error.localizedDescription)
                    }
            }
            
        } else {
            DispatchQueue.main.async {
                self.failedAuthentication = true
            }
        }
        
        
    }
    
    public func addEmergencia() async {
        
        //obtener descripcion
        let descripcion = isNivelGravedadSelected ? "Nivel de gravedad: \(nivel)" : descripcion
        
        //agregar los datos de ubicación
        let longitud = locationManager.lastLocation?.longitude
        let latitud = locationManager.lastLocation?.latitude
        
        let result : Result<APIResponseModel<DataEmergenciaGrupoModel>, NetworkError>
        
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
                
                
                result = await Webservice().postRequest("/emergencias/grupo", with: data)
            } else {
                let data = EmergenciaContactosModel(
                    tipo: selectedMotivo,
                    descripcion: descripcion.count > 0 ? descripcion : nil,
                    idEmisor: tokens.id,
                    longitud: (longitud != nil) ? Float(longitud!) : nil,
                    latitud: (latitud != nil) ? Float(latitud!) : nil
                )
                
                result = await Webservice().postRequest("/emergencias/allgrupo", with: data)
            }
            
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.dataEmergencia = data.data!
                    self.showEstatusView = true
                }
            case .failure(let error):
                switch error {
                case .badStatus(let error, _):
                    if(error == 401){
                        DispatchQueue.main.async {
                            self.failedAuthentication = true
                        }
                    }
                default:
                    print(error.self)
                    print(error.localizedDescription)
                }
                
            }
        } else {
            DispatchQueue.main.async {
                self.failedAuthentication = true
            }
        }
        
    }
    
    public func updateSelectedMotivo(motivo: String) {
            // Restablecer todas las selecciones
            resetSelectedMotivos()
            
            // Actualizar motivo y descripción según el motivo seleccionado
            switch motivo {
            case "Médica":
                isMedicaSelected = true
                selectedMotivo = motivo
                descripcion = "He tenido una emergencia médica, por favor ven a ayudarme"
            case "Acoso":
                isAcosoSelected = true
                selectedMotivo = motivo
                descripcion = "Ayúdame, me están acosando, ven pronto"
            case "Secuestro":
                isSecuestroSelected = true
                selectedMotivo = motivo
                descripcion = "Estoy teniendo un intento de secuestro"
            case "Desastre natural":
                isDesastreSelected = true
                selectedMotivo = motivo
                descripcion = "Ha sucedido un desastre natural"
            case "Incendio":
                isIncendioSelected = true
                selectedMotivo = motivo
                descripcion = "Está sucediendo un incendio"
            case "Accidente de tráfico":
                isTraficoSelected = true
                selectedMotivo = motivo
                descripcion = "He tenido un accidente de tráfico, ven a ayudarme"
            case "Extorsión":
                isExtorsionSelected = true
                selectedMotivo = motivo
                descripcion = "Estoy siendo víctima de una extorsión"
            case "Emergencia tecnológica":
                isTecnologicaSelected = true
                selectedMotivo = motivo
                descripcion = "He tenido una emergencia tecnológica, por favor ven a ayudarme"
            default:
                break
            }
        }
        
        public func resetSelectedMotivos() {
            // Restablecer todas las selecciones
            isMedicaSelected = false
            isAcosoSelected = false
            isSecuestroSelected = false
            isDesastreSelected = false
            isIncendioSelected = false
            isTraficoSelected = false
            isExtorsionSelected = false
            isTecnologicaSelected = false
        }
        
        public func isSelected(motivo: String) -> Bool {
            // Verificar si un motivo está seleccionado
            switch motivo {
            case "Médica":
                return isMedicaSelected
            case "Acoso":
                return isAcosoSelected
            case "Secuestro":
                return isSecuestroSelected
            case "Desastre natural":
                return isDesastreSelected
            case "Incendio":
                return isIncendioSelected
            case "Accidente de tráfico":
                return isTraficoSelected
            case "Extorsión":
                return isExtorsionSelected
            case "Emergencia tecnológica":
                return isTecnologicaSelected
            default:
                return false
            }
        }


}


