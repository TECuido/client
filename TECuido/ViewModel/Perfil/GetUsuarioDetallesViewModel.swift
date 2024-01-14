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
    @Published var contactoError: Int =  0
    @Published var nombreError: Int =  0
    @Published var addedContacto: Bool = false
   
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
    
    public func updateUsuarioDetalles(numPoliza:String, tipoSangre: String, contactoEmergencia: String, transfusionSanguinea: String, donacionOrganos:String, direccion: String , edad: String,medicoTratante: String  ,nombre:String ) async {
        
        do {
         
            if contactoEmergencia.isEmpty {
                contactoError = 1
                throw ValidationError.error(description: "Debes ingresar el correo del contacto")
            }
            
            

            DispatchQueue.main.async {
                self.contactoError = 0
            
                self.error = ""
            }

            if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {
                
                let data = EditarUsuarioDetallesModel(
                    numPoliza: numPoliza,
                    tipoSangre: tipoSangre,
                    contactoEmergencia: contactoEmergencia,
                    transfusionSanguinea: transfusionSanguinea,
                    donacionOrganos: donacionOrganos,
                    direccion: direccion,
                    edad: edad,
                    medicoTratante: medicoTratante,
                    nombre: nombre
                )

                print("Request Data: \(data)")
                print(tokens.id)

                let result: Result<APIResponseModel<UsuarioUpdateResponse>, NetworkError> = await Webservice().putRequest("/usuariodetalles/\(tokens.id)", with: data)
                print("API Response: \(result)")
                self.addedContacto = true
                switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self.addedContacto = true
                    }
                case .failure(let error):
                    switch error {
                        
                    case .badStatus(let error, let message):
                        if error == 401 {
                            DispatchQueue.main.async {
                                self.failedAuthentication = true
                                print(error)
                            }
                            
                        }
                        DispatchQueue.main.async {
                            self.error = message
                            print(error)
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
        } catch ValidationError.error(let description) {
            DispatchQueue.main.async {
                self.error = description
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    }
    
