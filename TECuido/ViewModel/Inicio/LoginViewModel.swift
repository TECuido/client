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
    @Published var tipoUsuario: Int = 0
    
    func login() async {
        
        do {
            
            if(correo.isEmpty || password.isEmpty){
                DispatchQueue.main.async {
                    self.correoError = self.correo.isEmpty ? 1 : 0
                    self.passwordError = self.password.isEmpty ? 1 : 0
                }
                
                throw ValidationError.error(description: "Debes ingresar tu correo y contraseña")
            }
            
            DispatchQueue.main.async {
                self.message = ""
            }
            
            let result = await Webservice().login(correo: correo, password: password)
            
            switch result {
                case .success(let token):
                    
                    let accessKeys = AccessKeys(id: token.id!, accessToken: token.accessToken!, refreshToken: token.refreshToken!)
                    let account = "tecuido.com"
                    let service = "token"
                    KeychainHelper.standard.save(accessKeys, service: service, account: account)
                    
                    DispatchQueue.main.async {
                        self.tipoUsuario = token.tipo!
                        self.correoError = 0
                        self.passwordError = 0
                        self.isAuthenticated = true
                    }
                
                case .failure(let error):
                    switch(error){
                    case NetworkError.badStatus(let error, _):
                        if error == 404 {
                            DispatchQueue.main.async {
                                self.message = "El correo no se encuentra registrado"
                                self.correoError = 1
                                self.passwordError = 0
                            }
                        } else if error == 400 {
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
            DispatchQueue.main.async {
                self.message = description
            }
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
