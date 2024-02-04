//
//  EditContactViewModel.swift
//  TECuido
//
//  Created by Alumno on 03/02/24.
//

import Foundation

class EditContactViewModel: ObservableObject {
    @Published var error: String = ""

    @Published var contactoError: Int =  0
    @Published var nombreError: Int =  0
    
    @Published var usuarioDetalles: [EditContactModel] = []
    @Published var contactoEmergencia: String = ""
    

    @Published var perfilEditado = false
   
    
    public func updateContact(idContacto: Int  ,nombre:String, correo:String,telefono: String) async {
        
        do {
            
            if nombre.isEmpty{
                DispatchQueue.main.async {
                    self.contactoError = 1
                }
                throw ValidationError.error(description: "Debes ingresar el nombre del contacto")
            }
            
            if telefono.isEmpty{
                DispatchQueue.main.async {
                    self.contactoError = 1
                }
                throw ValidationError.error(description: "Debes ingresar el telefono del contacto")
            }
            
        
            DispatchQueue.main.async {
                self.contactoError = 0
                self.error = ""
            }

         
                
                let data = EditContactModel(
                    nombre: nombre,
                    correo: correo,
                    telefono: telefono
                )
                    print(data)

                let result: Result<APIResponseModel<ResponseEditContact>, NetworkError> = await Webservice.instance.putRequest("/contactos/\(idContacto)", with: data)
            
                print(result)
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
        } catch ValidationError.error(let description) {
            DispatchQueue.main.async {
                self.error = description
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
   

}
    
