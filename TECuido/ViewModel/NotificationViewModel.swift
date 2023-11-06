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
    
    public func sendNotificationToken() async {
        do {
            
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
