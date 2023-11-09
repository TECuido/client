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

    func setEmergencia(notification: [AnyHashable: Any]){
        
        var longitud = notification["longitud"] as? Double
        var latitud = notification["latitud"] as? Double
        
        
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
            
            let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
            let data = NotificatioTokenModel(token: notificationToken)
            let result : Result<APIResponseModel<UsuarioTokenModel>, NetworkError> = await Webservice().putRequest("/usuarios/\(tokens.id)/notification/token", with: data)
            
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.tokenAgregado = true
                }
            case .failure(let error):
                switch error {
                default:
                    print(error.self)
                    print(error.localizedDescription)
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
