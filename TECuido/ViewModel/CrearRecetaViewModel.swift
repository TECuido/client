//
//  CrearRecetaViewModel.swift
//  TECuido
//
//  Created by Alumno on 25/10/23.
//


import Foundation
import SwiftUI

extension Date {
    static func localDate() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {
            return nowUTC
        }
        return localDate
    }
}

class CrearRecetaViewModel : ObservableObject {
        
    @Published var titulo: String =  ""
    @Published var fecha: Date =  Date()
    @Published var idMedico: Int = -1
    @Published var medicamentos: [CrearMedicamentoModel] = [CrearMedicamentoModel]()
    @Published var recetaCreada = false
    
    @Published var error: String = ""
    
    @Published var failedAuthentication: Bool = false

    public func createReceta() async {
        
        do {
            
            if(titulo.isEmpty){
                throw ValidationError.error(description: "Debes ingresar el titulo de la receta")
            } else if(medicamentos.count == 0){
                throw ValidationError.error(description: "Debes ingresar al menos un medicamento")
            }
            
            for (index, element) in medicamentos.enumerated() {
                
                if(element.dosis.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar la dosis del medicamento \(index+1)")
                } else if(element.duracion.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar la duracion del medicamento \(index+1)")
                } else if(element.frecuencia.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar la duracion de la descripción \(index+1)")
                } else if(element.nombre.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar la duracion del nombre \(index+1)")
                }
                
            }
            
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            let data = CrearRecetaModel(
                nombre: titulo,
                fecha: dateFormatter.string(from: Date.localDate()),
                idMedico: idMedico != -1 ? idMedico : nil
            )
            
            if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
                
                let result : Result<APIResponseModel<RecetaModel>, NetworkError> = await Webservice().postRequest("/recetas/usuario/\(tokens.id)", with: data)
                
                
                switch result {
                    case .success(let data):
                        for (index, element) in medicamentos.enumerated() {
                            await createMedicamento(medicamento: element, index: index, idReceta: data.data!.id)
                        }
                        DispatchQueue.main.async {
                            self.recetaCreada = true
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
        }
    }
    
    public func createMedicamento(medicamento: CrearMedicamentoModel, index: Int, idReceta: Int) async {
        do {
            
            let result : Result<APIResponseModel<MedicamentoModel>, NetworkError> = await Webservice().postRequest("/medicamentos/receta/\(idReceta)", with: medicamento)
            
            switch result {
                case .success(let data):
                    return
                case .failure(let error):
                    switch error {
                    case .badStatus(let error, let message):
                        DispatchQueue.main.async {
                            if(error == 401){
                                DispatchQueue.main.async {
                                    self.failedAuthentication = true
                                }
                            }
                            self.error = message
                        }
                default:
                    print(error.localizedDescription)
                }
                
            }
            
        } catch ValidationError.error(let description){
            DispatchQueue.main.async {
                self.error = description
            }
        } catch {
            print(error.localizedDescription)
        }
    }
     
    
}
    
