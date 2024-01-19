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
    
    @Published var usuarioDetalles: [UsuarioDetallesGetModel] = []
    @Published var contactoEmergencia: String = ""
    
    @Published var correoEnviado = false
    @Published var perfilEditado = false
    
    private func formatData(_ data: String) -> String{
        if(data == "Sin información"){
            return ""
        } else {
            return data
        }
    }
   
    func formatResult(_ data: String) -> String{
        if(data == ""){
            return "Sin información"
        } else {
            return data
        }
    }
    
    public func getUsuarioDetalles() async {
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {
            let result : Result<APIResponseModel<[UsuarioDetallesGetModel]>, NetworkError> = await Webservice.instance.getRequest("/usuariodetalles/\(tokens.id)")
            switch result {
            case .success(let data):
                if let data = data.data {
                    DispatchQueue.main.async {
                        let detalle = data[0]
                        self.usuarioDetalles = [UsuarioDetallesGetModel(
                            idUsuariosDetalles: detalle.idUsuariosDetalles,
                            idUsuario: detalle.idUsuario,
                            Usuario: detalle.Usuario,
                            numPoliza: self.formatData(detalle.numPoliza),
                            tipoSangre: self.formatData(detalle.tipoSangre),
                            idContactoEmergencia: detalle.idContactoEmergencia,
                            contactoEmergencia: detalle.contactoEmergencia,
                            transfusionSanguinea: self.formatData(detalle.transfusionSanguinea),
                            donacionOrganos: self.formatData(detalle.donacionOrganos),
                            direccion: self.formatData(detalle.direccion),
                            edad: self.formatData(detalle.edad),
                            medicoTratante: self.formatData(detalle.medicoTratante)
                        )]
                    }
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
                DispatchQueue.main.async {
                    self.contactoError = 1
                }
                throw ValidationError.error(description: "Debes ingresar el correo del contacto")
            }
            
        
            DispatchQueue.main.async {
                self.contactoError = 0
                self.error = ""
            }

            if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {
                
                let data = EditarUsuarioDetallesModel(
                    numPoliza: formatResult(numPoliza),
                    tipoSangre: formatResult(tipoSangre),
                    contactoEmergencia: contactoEmergencia,
                    transfusionSanguinea: formatResult(transfusionSanguinea),
                    donacionOrganos: formatResult(donacionOrganos),
                    direccion: formatResult(direccion),
                    edad: formatResult(edad),
                    medicoTratante: formatResult(medicoTratante),
                    nombre: nombre
                )

                let result: Result<APIResponseModel<UsuarioUpdateResponse>, NetworkError> = await Webservice.instance.putRequest("/usuariodetalles/\(tokens.id)", with: data)
                switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self.perfilEditado = true
                    }
                case .failure(let error):
                    switch error {
                        
                    case .badStatus(_, let message):
                        DispatchQueue.main.async {
                            self.error = message
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
    
    public func enviarCorreo() async {
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {
            let result : Result<APIResponseModel<UsuarioDetallesModel>, NetworkError> = await Webservice.instance.postRequest("/usuariodetalles/usuarios/\(tokens.id)/correo", with: EnviarCorreoModel(id: tokens.id))
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.correoEnviado = true
                }
            case .failure(let error):
                print(error.self)
                print(error.localizedDescription)
            }
        }
    }

}
    
