//  GetUsuarioDetallesModel.swift
//  TECuido
//
//  Created by Alumno on 13/01/24.
//
import Foundation
class GetUsuarioDetallesViewModel: ObservableObject {
    var nombre: String = ""
    @Published var usuarioDetalles: [GetUsuarioDetallesModel] = []
    @Published var error: String = ""

    @Published var failedAuthentication: Bool = false
    
    public func getUsuarioDetalles() async {
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {
            let result : Result<APIResponseModel<[GetUsuarioDetallesModel]>, NetworkError> = await Webservice().getRequest("/usuariodetalles/\(tokens.id)")
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.usuarioDetalles = data.data!
                }
            case .failure(let error):
                print(error.self)
                print(error.localizedDescription)
            }
        } else {
            DispatchQueue.main.async {
                self.failedAuthentication = true
            }
        }
    }
}
