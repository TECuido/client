//
//  MedicamentosActualesViewModel.swift
//  TECuido
//
//  Created by Alumno on 11/01/24.
//

import Foundation



class MedicamentosActualesViewModel: ObservableObject {
    var nombre: String = ""
    @Published var medicamento: [MedicamentosActualesModel] = []
    @Published var nombreError: Int =  0
    @Published var error: String = ""
    @Published var medicamentoCreado: Bool = false
    
    @Published var failedAuthentication: Bool = false

    public func getMedicamentosActuales() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {
            
            let result : Result<APIResponseModel<[MedicamentosActualesModel]>, NetworkError> = await Webservice().getRequest("/medicamentosActuales/\(tokens.id)")
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.medicamento = data.data!
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
    
    
    public func crearMedicamentosActuales() async {
        do {
            
            if(nombre.isEmpty){
                nombreError = 1
                throw ValidationError.error(description: "Debes ingresar el nombre de medicamento")
            }
            
            nombreError = 0
            error = ""
            
            if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
                
                let data = MedicamentosActualesModel(nombre: nombre, idUsuario: tokens.id)
                let result : Result<APIResponseModel<MedicamentosActualesModel>, NetworkError> = await Webservice().postRequest("/medicamentosActuales/", with: data)
                            
                switch result {
                    case .success(let data):
                    
                    DispatchQueue.main.async {
                        self.medicamentoCreado = true
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
