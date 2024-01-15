//  UsuarioDetallesViewModel.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//


import Foundation
import SwiftUI

class UsuarioDetallesViewModel : ObservableObject {

    var numPoliza: String = ""
    var tipoSangre: String = ""
    var contactoEmergencia: String = ""
    var transfusionSanguinea: String = ""
    var donacionOrganos: String = ""
    var direccion: String = ""
    var edad: String = ""
    var medicoTratante: String = ""

    @Published var contactoError: Int =  0
    @Published var error: String = ""
    @Published var addedContacto: Bool = false
    @Published var failedAuthentication: Bool = false
    
    public func addUsuarioDetalles() async {
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
                var data = UsuarioDetallesModel( numPoliza: "Sin información", tipoSangre: "Sin información", contactoEmergencia: contactoEmergencia,  transfusionSanguinea: "Sin información", donacionOrganos: "Sin información", direccion: "Sin información", edad: "Sin información", medicoTratante: "Sin información")

                // Check and assign non-empty values
                if !numPoliza.isEmpty {
                    data.numPoliza = numPoliza
                }
                if !tipoSangre.isEmpty {
                    data.tipoSangre = tipoSangre
                }
                if !transfusionSanguinea.isEmpty {
                    data.transfusionSanguinea = transfusionSanguinea
                }
                if !donacionOrganos.isEmpty {
                    data.donacionOrganos = donacionOrganos
                }
                if !direccion.isEmpty {
                    data.direccion = direccion
                }
                if !edad.isEmpty {
                    data.edad = edad
                }
                if !medicoTratante.isEmpty {
                    data.medicoTratante = medicoTratante
                }

                print("Request Data: \(data)")
                print(tokens.id)

                let result: Result<APIResponseModel<PostUsuarioDetallesModel>, NetworkError> = await Webservice().postRequest("/usuariodetalles/\(tokens.id)", with: data)
                print("API Response: \(result)")

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
        } catch ValidationError.error(let description) {
            DispatchQueue.main.async {
                self.error = description
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
