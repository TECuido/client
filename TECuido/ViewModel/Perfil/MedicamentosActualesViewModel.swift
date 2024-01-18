//
 //  MedicamentosActualesViewModel.swift
 //  TECuido
 //
 //  Created by Alumno on 11/01/24.
 //

 import Foundation



 class MedicamentosActualesViewModel: ObservableObject {
     var nombre: String = ""
     @Published var medicamento: [MedicamentosActualesModel] = []
     @Published var nombreError: Int =  0
     @Published var error: String = ""
     @Published var medicamentoCreado: Bool = false
     @Published var medicamentoSeleccionado = MedicamentosActualesModel.example

     public func getMedicamentosActuales() async {

         if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self) {

             let result : Result<APIResponseModel<[MedicamentosActualesModel]>, NetworkError> = await Webservice.instance.getRequest("/medicamentosActuales/\(tokens.id)")

             switch result {
             case .success(let data):
                 DispatchQueue.main.async {
                     self.medicamento = data.data!
                 }
             case .failure(let error):
                 print(error.self)
                 print(error.localizedDescription)
             }
         }
     }


     public func crearMedicamentosActuales() async {
         do {

             if(nombre.isEmpty){
                 nombreError = 1
                 throw ValidationError.error(description: "Debes ingresar el nombre de medicamento")
             }

             nombreError = 0
             error = ""

             if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){

                 let data = AgregaMedicamentosActualesModel(nombre: nombre, idUsuario: tokens.id)
                 let result : Result<APIResponseModel<AgregaMedicamentosActualesModel>, NetworkError> = await Webservice.instance.postRequest("/medicamentosActuales/", with: data)

                 switch result {
                     case .success(_):

                     DispatchQueue.main.async {
                         self.medicamentoCreado = true
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
     
     public func deleteMedicamentosActuales() async {
         let idMedicamentoActual = self.medicamentoSeleccionado.id
         let result : Result<APIResponseModel<MedicamentosActualesModel>, NetworkError> = await Webservice.instance.deleteRequest("/medicamentosActuales/\(idMedicamentoActual )")
         switch result {
         case .success(let data):
             print(data)
             //return
         case .failure(let error):
             print(error)
         }
     }
 }
