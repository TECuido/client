//
 //  EditarContactoEmergenciaViewModel.swift
 //  TECuido
 //
 //  Created by Alumno on 17/01/24.
 //

 import Foundation
 class EditarContactoEmergenciaViewModel : ObservableObject {
     @Published var selectedOptionContacto: String = "Contacto de emergencia"
     @Published var contactos: [ContactoModel] = [ContactoModel.defaultContacto]
     @Published var contactosNombres: [String] = ["Contacto de emergencia"]

     public func getContactos( contacto:String) async {

         if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){


             let result : Result<APIResponseModel<[ContactoModel]>, NetworkError> = await Webservice.instance.getRequest("/contactos/usuario/\(tokens.id)")

             switch result {
             case .success(let data):
                 DispatchQueue.main.async {
                     self.contactos = data.data!
                     if(self.contactos.count > 0){
                         self.contactosNombres = [contacto] + self.contactos.map{
                             $0.nombre
                         }
                         self.selectedOptionContacto = self.contactosNombres[0]
                     }
                 }
             case .failure(let error):
                 print(error.localizedDescription)

             }
         }

     }
 }
