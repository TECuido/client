//
//  NotificacionViewModel.swift
//  TECuido
//
//  Created by Julio on 5/11/23.
//

import Foundation


class NotificationViewModel: ObservableObject {
    
    @Published var notificationToken: String = ""
    @Published var tokenAgregado: Bool = false
    
    @Published var navigateToNotificationView: Bool = false
    @Published var emergencia: DataEmergenciaGrupoModel = DataEmergenciaGrupoModel.defaultEmergencia
    
    @Published var failedAuthentication: Bool = false


    func setEmergencia(notification: [AnyHashable: Any]){
        
        let longitud = notification["longitud"] as? Double
        let latitud = notification["latitud"] as? Double
        
        
        self.emergencia = DataEmergenciaGrupoModel(
            idEmergencia: notification["idEmergencia"] as! Int,
            tipo: notification["tipo"] as! String,
            descripcion: notification["descripcion"] as? String,
            idEmisor: notification["idEmisor"] as! Int,
            longitud: longitud != nil ? Float(longitud!) : nil,
            latitud:  latitud != nil ? Float(latitud!) : nil,
            emisor: notification["emisor"] as? String
        )
        
    }
    
    public func sendNotificationToken() async {
        do {
            
            if(notificationToken.count == 0){
                throw ValidationError.error(description: "Token invalido")
            }
            
            if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {
                
                let data = NotificatioTokenModel(token: notificationToken)
                let result : Result<APIResponseModel<UsuarioTokenModel>, NetworkError> = await Webservice().putRequest("/usuarios/\(tokens.id)/notification/token", with: data)
                
                
                switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self.tokenAgregado = true
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
            
        } catch {
            print(error.localizedDescription)
            DispatchQueue.main.async {
                print(error)
            }
        }
    }
    
    
}
