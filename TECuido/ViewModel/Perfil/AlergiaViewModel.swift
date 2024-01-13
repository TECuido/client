//
 //  AlergiaViewModel.swift
 //  TECuido
 //
 //  Created by Alumno on 11/01/24.
 //

 import Foundation


 class AlergiaViewModel: ObservableObject {
     var nombre: String = ""
     @Published var alergias: [AlergiaModel] = []
     @Published var selectedIndices: [Int] = []
     @Published var nombreError: Int =  0
     @Published var error: String = ""
     @Published var alergiaCreada: Bool = false
     
     @Published var failedAuthentication: Bool = false
     
     public func getAlergias() async {

         if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {

             let result : Result<APIResponseModel<[AlergiaModel]>, NetworkError> = await Webservice().getRequest("/alergias/\(tokens.id)")

             switch result {
             case .success(let data):
                 DispatchQueue.main.async {
                     self.alergias = data.data!
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


     public func crearAlergia() async {
         do {

             if(nombre.isEmpty){
                 nombreError = 1
                 throw ValidationError.error(description: "Debes ingresar el nombre de la alergia")
             }



             nombreError = 0
             error = ""

             if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){

                 let data = AlergiaModel(nombre: nombre, idUsuario: tokens.id)
                 let result : Result<APIResponseModel<AlergiaModel>, NetworkError> = await Webservice().postRequest("/alergias", with: data)

                 switch result {
                     case .success(_):

                     DispatchQueue.main.async {
                         self.alergiaCreada = true
                     }
                     case .failure(let error):
                         switch error {
                         case .badStatus(let error, let message):
                             if(error == 401){
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




         } catch ValidationError.error(let description){
             DispatchQueue.main.async {
                 self.error = description
             }
         } catch {
             print(error.localizedDescription)
             DispatchQueue.main.async {
                 self.error = "Ocurrió un error"
             }
         }
     }
 }
