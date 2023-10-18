//
//  usuarioViewModel.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//
import Foundation
import SwiftUI

class UsuarioViewModel : ObservableObject {
    
    var correo:String = ""
    var password:String = ""
    
    @Published var message: String = ""
    @Published var correoError: Int =  0
    @Published var passwordError: Int =  0
    @Published var isAuthenticated: Bool = false
    
    func login() async {
        
        do {
            
            if(correo.isEmpty || password.isEmpty){
                self.correoError = correo.isEmpty ? 1 : 0
                self.passwordError = password.isEmpty ? 1 : 0
                
                throw ValidationError.error(description: "Debes ingresar tu correo y contraseña")
            }
            
            self.message = ""
            let result = await Webservice().login(correo: correo, password: password)
            
            switch result {
                case .success(let token):
                    UserDefaults.standard.setValue(token.accessToken, forKey: "accessToken")
                    UserDefaults.standard.setValue(token.refreshToken, forKey: "refreshToken")
                    DispatchQueue.main.async {
                        self.correoError = 0
                        self.passwordError = 0
                        self.isAuthenticated = true
                    }
                case .failure(let error):
                    switch(error){
                        case NetworkError.badStatus(let errorNumber):
                        if errorNumber == 404 {
                            DispatchQueue.main.async {
                                self.message = "El correo no se encuentra registrado"
                                self.correoError = 1
                                self.passwordError = 0
                            }
                        } else if errorNumber == 400 {
                            DispatchQueue.main.async {
                                self.message = "El correo y contraseña no coinciden"
                                self.correoError = 1
                                self.passwordError = 1
                            }
                        }
                        default:
                            print(error.localizedDescription)
                            DispatchQueue.main.async {
                                self.message = "Ocurrió un error interno. Inténtalo de nuevo más tarde."
                                self.correoError = 0
                                self.passwordError = 0
                            }

                }
            }
            
        } catch ValidationError.error(let description) {
            self.message = description
        } catch {
            print(error.localizedDescription)
        }
        
        
        
    }
    
    func signout() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: ("accessToken"))
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
    }
    
    
}
