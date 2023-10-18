//
//  RegistroViewModel.swift
//  TECuido
//
//  Created by Julio on 17/10/23.
//
import Foundation
import SwiftUI

class RegistroViewModel : ObservableObject {
    
    var nombre: String = ""
    var correo: String = ""
    var password: String = ""
    var confPassword: String = ""

    @Published var message: String = ""
    @Published var nombreError: Int = 0
    @Published var correoError: Int =  0
    @Published var passwordError: Int =  0
    @Published var confPassError: Int = 0
    @Published var isAuthenticated: Bool = false
    
    func register() async {
        
        do {
            if(correo.isEmpty || password.isEmpty || nombre.isEmpty || confPassword.isEmpty){
                self.nombreError = nombre.isEmpty ? 1 : 0
                self.correoError = correo.isEmpty ? 1 : 0
                self.passwordError = password.isEmpty ? 1 : 0
                self.confPassError = confPassword.isEmpty ? 1 : 0
                
                throw ValidationError.error(description: "Debes completar todos los campos")
            }
            
            if(password != confPassword){
                self.nombreError = 0
                self.correoError = 0
                self.passwordError = 1
                self.confPassError = 1
                
                throw ValidationError.error(description: "Las contraseñas no coinciden")
            }
            
            let result = await Webservice().register(nombre: nombre, correo: correo, password: password)
            
            switch result {
                case .success(let token):
                    UserDefaults.standard.setValue(token.accessToken, forKey: "accessToken")
                    UserDefaults.standard.setValue(token.refreshToken, forKey: "refreshToken")
                    DispatchQueue.main.async {
                        self.message = ""
                        self.isAuthenticated = true
                    }
                case .failure(let error):
                    switch(error){
                        case NetworkError.badStatus(let errorNumber):
                        if errorNumber == 400 {
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
            self.message = description
        } catch {
            
        }
            
        
    }
    
    
    
}
