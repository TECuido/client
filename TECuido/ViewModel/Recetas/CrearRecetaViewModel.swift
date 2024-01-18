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
    
    @Published var selectedOptionPaciente: String = ""
    @Published var pacientes: [ContactoModel] = [ContactoModel.defaultContacto]
    @Published var pacientesNombres: [String] = [ContactoModel.defaultContacto.nombre]
    
    @Published var recetaCreada = false
    
    @Published var error: String = ""
        
    
    public func getPacientes() async {
        
        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            
            let result : Result<APIResponseModel<[ContactoModel]>, NetworkError> = await Webservice.instance.getRequest("/contactos/usuario/\(tokens.id)")
            
            switch result {
                case .success(let data):
                    if let data = data.data {
                        DispatchQueue.main.async {
                            self.pacientes = data.filter {
                                $0.usuarioAgregado != nil
                            }
                            if(self.pacientes.count > 0){
                                self.pacientesNombres = self.pacientes.map{
                                    $0.nombre
                                }
                                self.selectedOptionPaciente = self.pacientesNombres[0]
                            }
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
    }
    
    
    public func createRecetaPaciente() async {
        
        do {
            
            if(titulo.isEmpty){
                throw ValidationError.error(description: "Debes ingresar el título de la receta")
            } else if(medicamentos.count == 0){
                throw ValidationError.error(description: "Debes ingresar al menos un medicamento")
            }
            
            for (index, element) in medicamentos.enumerated() {
                if(element.nombre.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar el nombre del medicamento \(index+1)")
                } else if(element.dosis.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar la dosis del medicamento \(index+1)")
                } else if(element.frecuencia.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar la frecuencia del medicamento \(index+1)")
                } else if(element.duracion.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar la duración del medicamento \(index+1)")
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
                
                let result : Result<APIResponseModel<RecetaModel>, NetworkError> = await Webservice.instance.postRequest("/recetas/usuario/\(tokens.id)", with: data)
                
                
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
                        case .badStatus(_, let message):
                            DispatchQueue.main.async {
                                self.error = message
                            }
                        default:
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
        }
    }
    
    
    
    public func createRecetaMedico() async {
        
        do {
            
            if(titulo.isEmpty){
                throw ValidationError.error(description: "Debes ingresar el titulo de la receta")
            } else if(medicamentos.count == 0){
                throw ValidationError.error(description: "Debes ingresar al menos un medicamento")
            } else if(selectedOptionPaciente.isEmpty){
                throw ValidationError.error(description: "Debes seleccionar a un paciente")
            }
            
            for (index, element) in medicamentos.enumerated() {
                
                if(element.nombre.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar el nombre del medicamento \(index+1)")
                } else if(element.dosis.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar la dosis del medicamento \(index+1)")
                } else if(element.frecuencia.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar la frecuencia del medicamento \(index+1)")
                } else if(element.duracion.isEmpty){
                    throw ValidationError.error(description: "Debes ingresar la duración del medicamento \(index+1)")
                }
                
            }
            
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            
            if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
                
                let data = CrearRecetaModel(
                    nombre: titulo,
                    fecha: dateFormatter.string(from: Date.localDate()),
                    idMedico: tokens.id
                )
                
                let i = pacientes.firstIndex {
                    $0.nombre == selectedOptionPaciente
                } ?? -1
                
                if(i == -1){
                    throw ValidationError.error(description: "Ocurrió un problema con el paciente seleccionado")
                }
                
                let selectedPaciente = pacientes[i]
                
                if let idPaciente = selectedPaciente.usuarioAgregado?.idUsuario {
                    
                    let result : Result<APIResponseModel<RecetaModel>, NetworkError> = await Webservice.instance.postRequest("/recetas/usuario/\(idPaciente)", with: data)
                    
                    switch result {
                        case .success(let data):
                            for (index, element) in medicamentos.enumerated() {
                                await createMedicamento(medicamento: element, index: index, idReceta: data.data!.id)
                            }
                            DispatchQueue.main.async {
                                self.recetaCreada = true
                                self.error = ""
                            }
                        case .failure(let error):
                            switch error {
                            case .badStatus(_, let message):
                                DispatchQueue.main.async {
                                    self.error = message
                                }
                            default:
                                print(error.localizedDescription)
                            }
                    }
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
            
            let result : Result<APIResponseModel<MedicamentoModel>, NetworkError> = await Webservice.instance.postRequest("/medicamentos/receta/\(idReceta)", with: medicamento)
            
            switch result {
                case .success(_):
                    return
                case .failure(let error):
                    switch error {
                    case .badStatus(_, let message):
                        DispatchQueue.main.async {
                            self.error = message
                        }
                default:
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
     
    
}
    
