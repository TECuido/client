//
//  RegistroViewModel.swift
//  TECuido
//
//  Created by Julio on 17/10/23.
//
import Foundation
import SwiftUI

class RegistroViewModel : ObservableObject {
    
    @Published var nombre: String = ""
    @Published var correo: String = ""
    @Published var password: String = ""
    @Published var confPassword: String = ""
    @Published var telefono: String = ""

    @Published var message: String = ""
    @Published var nombreError: Int = 0
    @Published var correoError: Int =  0
    @Published var telefonoError: Int = 0
    @Published var passwordError: Int =  0
    @Published var confPassError: Int = 0
    @Published var isAuthenticated: Bool = false
    
    @Published var tipoUsuario: Int = 0

    
    func register(idTipo: Int) async {
        
        do {
            //checar que todos los campos fueran llenados
            if(correo.isEmpty || password.isEmpty || nombre.isEmpty || confPassword.isEmpty || telefono.isEmpty){
                DispatchQueue.main.async {
                    self.nombreError = self.nombre.isEmpty ? 1 : 0
                    self.correoError = self.correo.isEmpty ? 1 : 0
                    self.telefonoError = self.telefono.isEmpty ? 1 : 0
                    self.passwordError = self.password.isEmpty ? 1 : 0
                    self.confPassError = self.confPassword.isEmpty ? 1 : 0
                }
                
                throw ValidationError.error(description: "Debes completar todos los campos")
            }
            
            //checar que la contraseña y confirmación de contraseña coincidan
            if(password != confPassword){
                DispatchQueue.main.async {
                    self.nombreError = 0
                    self.correoError = 0
                    self.passwordError = 1
                    self.telefonoError = 0
                    self.confPassError = 1
                }
                
                throw ValidationError.error(description: "Las contraseñas no coinciden")
            }
            
            //checar que el email sea válido
            if(!isValidEmail(email: correo)){
                DispatchQueue.main.async {
                    self.nombreError = 0
                    self.correoError = 1
                    self.telefonoError = 0
                    self.passwordError = 0
                    self.confPassError = 0
                }
                throw ValidationError.error(description: "Correo inválido")
            }
            
            if(!isValidTelefono(telefono: telefono)){
                DispatchQueue.main.async {
                    self.nombreError = 0
                    self.correoError = 0
                    self.telefonoError = 1
                    self.passwordError = 0
                    self.confPassError = 0
                }
                throw ValidationError.error(description: "Ingresa el teléfono en formato de 10 números")
            }
            
            //checar que la contraseña sea válida
            if(!isValidPassword(password: password)){
                DispatchQueue.main.async {
                    self.nombreError = 0
                    self.correoError = 0
                    self.passwordError = 1
                    self.confPassError = 0
                }
                
                let errores = getMissingValidation(str: password).joined(separator: ", ")
                
                throw ValidationError.error(description: "La contraseña debe tener \(errores)")
            }
            
            DispatchQueue.main.async {
                self.nombreError = 0
                self.correoError = 0
                self.passwordError = 0
                self.confPassError = 0
                self.telefonoError = 0
                self.message = ""
            }
            
            //enviar request, anular errores
            let result = await Webservice().register(
                nombre: nombre,
                correo: correo,
                password: password,
                telefono: telefono,
                idTipo: idTipo
            )
                        
            switch result {
                case .success(let token):
                    let accessKeys = AccessKeys(id: token.id!, accessToken: token.accessToken!, refreshToken: token.refreshToken!)
                    let account = "tecuido.com"
                    let service = "token"
                    KeychainHelper.standard.save(accessKeys, service: service, account: account)
                    DispatchQueue.main.async {
                        self.tipoUsuario = token.tipo!
                        self.message = ""
                        self.isAuthenticated = true
                    }
                case .failure(let error):
                    switch(error){
                    case NetworkError.badStatus(let error, _):
                            if error == 400 {
                                DispatchQueue.main.async {
                                    self.message = "El usuario ya se encuentra registrado"
                                }
                            }
                        default:
                            print(error.localizedDescription)
                            DispatchQueue.main.async {
                                self.message = "Ocurrió un error interno. Inténtalo de nuevo más tarde."
                            }
                }
            }
        } catch ValidationError.error(let description) {
            DispatchQueue.main.async {
                self.message = description
            }
        } catch {
            print(error.localizedDescription)
        }
            
        
    }
    
    //validar email con regex
    func isValidEmail(email: String) -> Bool {
        if email.count > 100 {
                return false
        }
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidTelefono(telefono: String) -> Bool {
        if telefono.count != 10 {
            return false
        }
        let telRegx = "^[0-9]{10}$"
        let telCheck = NSPredicate(format: "SELF MATCHES %@",telRegx)
        return telCheck.evaluate(with: telefono)
    }
    
    //validar contraseña con regex
    func isValidPassword(password: String) -> Bool {
        // al menos una mayuscula
        // al menos un digito
        // al menos una minuscula
        // al menos un simbolo
        // min 8, max 64 caracteres
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,64}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)

    }
    
    //retornar errores de contaseña
    func getMissingValidation(str: String) -> [String] {
        var errors: [String] = []
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: str)){
            errors.append("al menos una mayúscula")
        }
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: str)){
            errors.append("al menos un dígito")
        }

        if(!NSPredicate(format:"SELF MATCHES %@", ".*[!&^%$#@()/]+.*").evaluate(with: str)){
            errors.append("al menos un caracter especial")
        }
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: str)){
            errors.append("al menos una minúscula")
        }
        
        if(str.count < 8){
            errors.append("al menos 8 caracteres")
        }
        
        if(str.count > 64){
            errors.append("ser menor de 65 caracteres")
        }
        
        return errors
    }
    
    
    
    
    
    
}
