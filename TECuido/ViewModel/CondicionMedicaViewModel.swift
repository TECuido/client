//
//  CondicionMedicaViewModel.swift
//  TECuido
//
//  Created by Alumno on 11/01/24.
//

import Foundation


class CondicionMedicaViewModel: ObservableObject {
    var nombre: String = ""
    @Published var condicion: [CondicionMedicaModel] = []
    @Published var nombreError: Int =  0
    @Published var error: String = ""
    @Published var condicionCreada: Bool = false
    
    @Published var failedAuthentication: Bool = false

    public func getCondicionMedica() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {
            
            let result : Result<APIResponseModel<[CondicionMedicaModel]>, NetworkError> = await Webservice().getRequest("/condicionMedica/\(tokens.id)")
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.condicion = data.data!
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
    
    
    public func crearCondicion() async {
        do {
            
            if(nombre.isEmpty){
                nombreError = 1
                throw ValidationError.error(description: "Debes ingresar el nombre de la condicion medica")
            }
            
            
            
            nombreError = 0
            error = ""
            
            if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
                
                let data = CondicionMedicaModel(nombre: nombre, idUsuario: tokens.id)
                let result : Result<APIResponseModel<CondicionMedicaModel>, NetworkError> = await Webservice().postRequest("/condicionMedica", with: data)
                            
                switch result {
                    case .success(let data):
                    
                    DispatchQueue.main.async {
                        self.condicionCreada = true
                    }
                    case .failure(let error):
                        switch error {
                        case .badStatus(let error, let message):
                            if(error == 401){
                                DispatchQueue.main.async {
                                    self.failedAuthentication = true
                                }
                            }
                            DispatchQueue.main.async {
                                self.error = message
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
            
            
        } catch ValidationError.error(let description){
            DispatchQueue.main.async {
                self.error = description
            }
        } catch {
            print(error.localizedDescription)
            DispatchQueue.main.async {
                self.error = "Ocurrió un error"
            }
        }
    }
}
