//
 //  CondicionMedicaViewModel.swift
 //  TECuido
 //
 //  Created by Alumno on 11/01/24.
 //

 import Foundation


 class CondicionMedicaViewModel: ObservableObject {
     var nombre: String = ""
     @Published var condicion: [CondicionMedicaModel] = []
     @Published var nombreError: Int =  0
     @Published var error: String = ""
     @Published var condicionCreada: Bool = false
     @Published var condicionSeleccionada = CondicionMedicaModel.example

     public func getCondicionMedica() async {

         if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {

             let result : Result<APIResponseModel<[CondicionMedicaModel]>, NetworkError> = await Webservice.instance.getRequest("/condicionMedica/\(tokens.id)")

             switch result {
             case .success(let data):
                 DispatchQueue.main.async {
                     self.condicion = data.data!
                 }
             case .failure(let error):
                 print(error.localizedDescription)
             }
         } 
     }


     public func crearCondicion() async {
         do {

             if(nombre.isEmpty){
                 nombreError = 1
                 throw ValidationError.error(description: "Debes ingresar el nombre de la condicion medica")
             }
             nombreError = 0
             error = ""

             if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){

                 let data = AgregaCondicionMedicaModel(nombre: nombre, idUsuario: tokens.id)
                 let result : Result<APIResponseModel<AgregaCondicionMedicaModel>, NetworkError> = await Webservice.instance.postRequest("/condicionMedica", with: data)

                 switch result {
                     case .success(_):

                     DispatchQueue.main.async {
                         self.condicionCreada = true
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
     
     
     public func deleteCondicionMedica() async {
         let idCondicionMedica = self.condicionSeleccionada.id
         let result : Result<APIResponseModel<CondicionMedicaModel>, NetworkError> = await Webservice.instance.deleteRequest("/condicionMedica/\(idCondicionMedica)")
         switch result {
         case .success(let data):
             print(data)
             //return
         case .failure(let error):
             print(error)
         }
     }
 }
