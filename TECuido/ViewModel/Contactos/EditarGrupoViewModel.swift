//
//  EditarGrupoViewModel.swift
//  TECuido
//
//  Created by Ruben Tandon Ramirez on 09/11/23.
//
import Foundation


class EditarGrupoViewModel: ObservableObject {
    @Published var nombreGrupo: String = ""
    @Published var contactos: [ContactoModel] = []
    @Published var miembros: [MiembroGrupoModel] = []
    @Published var selectedIndices: [Int] = []
    @Published var selectedIndicesOriginal: Set<Int> = []
    @Published var nombreError: Int =  0
    @Published var error: String = ""
    @Published var grupoEditado: Bool = false
    
    public func setNombreGrupo(nombre: String) {
        nombreGrupo = nombre
    }
    

    public func getContactos() async {

        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            
            let result : Result<APIResponseModel<[ContactoModel]>, NetworkError> = await Webservice().getRequest("/contactos/usuario/\(tokens.id)")
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.contactos = data.data!
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
            
    }
    
    
    
    public func getMiembros(idGrupo: Int) async {

        let result : Result<APIResponseModel<[MiembroGrupoModel]>, NetworkError> = await Webservice().getRequest("/grupos/\(idGrupo)/usuarios/")

        switch result {
        case .success(let data):
            DispatchQueue.main.async {
                self.miembros = data.data!
                for miembro in self.miembros {
                    let idx = self.contactos.firstIndex  {
                        $0.usuarioAgregado.id == miembro.miembroGrupo.id
                    }
                    self.selectedIndices.append(idx!)
                    self.selectedIndicesOriginal.insert(miembro.miembroGrupo.id)
                }
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    

    public func updateMiembros(idGrupo: Int, nombreGrupo: String) async {
        
        do {
            
            if nombreGrupo == "" {
                DispatchQueue.main.async {
                    self.nombreError = 1
                }
                throw ValidationError.error(description: "Debes ingresar un nombre para el grupo")
            }
            
            if self.selectedIndices.isEmpty{
                throw ValidationError.error(description: "Debes seleccionar al menos un contacto")
            }
            
            var selectedIndicesFinal: Set<Int> = []

            for index in self.selectedIndices {
                selectedIndicesFinal.insert(self.contactos[index].usuarioAgregado.id)
            }

            let OriginalMinFinal: Set<Int> = self.selectedIndicesOriginal.subtracting(selectedIndicesFinal)
            let FinalMinOriginal: Set<Int> = selectedIndicesFinal.subtracting(self.selectedIndicesOriginal)
            
            DispatchQueue.main.async {
                self.nombreError = 0
                self.error = ""
            }
            
            let data = EditarNombreGrupoModel(nombre: nombreGrupo)
            let result: Result<APIResponseModel<GrupoModel>, NetworkError> = await Webservice().putRequest("/grupos/\(idGrupo)", with: data)
            switch result {
            case .success(_):
                for idMiembro in OriginalMinFinal {
                    try await deleteMiembros(idMiembro: idMiembro, idGrupo: idGrupo)
                }

                for idMiembro in FinalMinOriginal {
                    try await addMiembros(idMiembro: idMiembro, idGrupo: idGrupo)
                }
                    
                DispatchQueue.main.async {
                    self.grupoEditado = true
                }
            case .failure(let error):
                    print(error)
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
    

    public func addMiembros(idMiembro: Int, idGrupo: Int) async throws {
        let data = AgregarMiembroModel(idMiembro: idMiembro, idGrupo: idGrupo)
        let result : Result<APIResponseModel<MiembroAgregadoModel>, NetworkError> = await Webservice().postRequest("/grupos/usuario", with: data)

        switch result {
            case .success(_):
                return
            case .failure(let error):
                throw error
        }

    }
    
    public func deleteMiembros(idMiembro: Int, idGrupo: Int) async throws {
        let result : Result<APIResponseModel<MiembroAgregadoModel>, NetworkError> = await Webservice().deleteRequest("/grupos/\(idGrupo)/\(idMiembro)")
        switch result {
        case .success(_):
            return
        case .failure(let error):
            throw error
        }
    }



}
