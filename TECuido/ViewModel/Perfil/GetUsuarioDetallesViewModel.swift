//  GetUsuarioDetallesModel.swift
//  TECuido
//
//  Created by Alumno on 13/01/24.
//
import Foundation
class GetUsuarioDetallesViewModel: ObservableObject {
    var nombre: String = ""
    @Published var error: String = ""

    @Published var contactoError: Int =  0
    @Published var nombreError: Int =  0
    @Published var addedContacto: Bool = false
    
    @Published var usuarioDetalles: [UsuarioDetallesGetModel] = []
    @Published var contactoEmergencia: String = ""
   
    public func getUsuarioDetalles() async {
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {
            let result : Result<APIResponseModel<[UsuarioDetallesGetModel]>, NetworkError> = await Webservice.instance.getRequest("/usuariodetalles/\(tokens.id)")
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.usuarioDetalles = data.data!
                }
            case .failure(let error):
                print(error.self)
                print(error.localizedDescription)
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

                let result: Result<APIResponseModel<UsuarioUpdateResponse>, NetworkError> = await Webservice.instance.putRequest("/usuariodetalles/\(tokens.id)", with: data)
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
                        DispatchQueue.main.async {
                            self.error = message
                            print(error)
                        }
                    default:
                        print(error.self)
                        print(error.localizedDescription)
                    }
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
    
