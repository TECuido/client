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
    @Published var editarGrupo: Bool = false
    @Published var editarGrupoFail: Bool = false
    
    @Published var failedAuthentication: Bool = false


    public func getContactos() async {

        if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
            
            let result : Result<APIResponseModel<[ContactoModel]>, NetworkError> = await Webservice().getRequest("/contactos/usuario/\(tokens.id)")

            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.contactos = data.data!
                    }
                case .failure(let error):
                    switch error {
                        case .badStatus(let error, _):
                            if(error == 401){
                                DispatchQueue.main.async {
                                    self.failedAuthentication = true
                                }
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

        
    }


    public func addMiembros(idMiembro: Int, idGrupo: Int) async throws {

        let data = AgregarMiembroModel(idMiembro: idMiembro, idGrupo: idGrupo)
        let result : Result<APIResponseModel<MiembroAgregadoModel>, NetworkError> = await Webservice().postRequest("/grupos/usuario", with: data)

        switch result {
            case .success(_):
                return
            case .failure(let error):
                switch error {
                    case .badStatus(let error, _):
                        if(error == 401){
                            DispatchQueue.main.async {
                                self.failedAuthentication = true
                            }
                        }
                    default:
                        print(error.self)
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
            switch error {
                case .badStatus(let error, _):
                    if(error == 401){
                        DispatchQueue.main.async {
                            self.failedAuthentication = true
                        }
                    }
                default:
                    print(error.self)
                    print(error.localizedDescription)
            }
        }
    }

    public func updateMiembros(idGrupo: Int, nombreGrupo: String) async {
//        print(nombreGrupo)
        
        if  nombreGrupo != ""{
            let data = EditarNombreGrupoModel(id: idGrupo, nombre: nombreGrupo)
            let result: Result<APIResponseModel<GrupoModel>, NetworkError> = await Webservice().putRequest("/grupos/\(idGrupo)", with: data)
            switch result {
            case .success(let data):
                print(data)
                //return
            case .failure(let error):
                print(error)
            }
        }

        var selectedIndicesFinal: Set<Int> = []


        for index in self.selectedIndices {
            selectedIndicesFinal.insert(self.contactos[index].usuarioAgregado.id)
        }


        if selectedIndicesFinal.isEmpty{
            DispatchQueue.main.async {
                self.editarGrupoFail = true
                self.editarGrupo = false
            }
            return
        }

        DispatchQueue.main.async {
            self.editarGrupo = true
            self.editarGrupoFail = false
        }


        let OriginalMinFinal: Set<Int> = self.selectedIndicesOriginal.subtracting(selectedIndicesFinal)
        for idMiembro in OriginalMinFinal {
            let result : Result<APIResponseModel<MiembroAgregadoModel>, NetworkError> = await Webservice().deleteRequest("/grupos/\(idGrupo)/\(idMiembro)")
            print(idGrupo, idMiembro)
            switch result {
            case .success(let data):
                print(data)
                //return
            case .failure(let error):
                switch error {
                    case .badStatus(let error, _):
                        if(error == 401){
                            DispatchQueue.main.async {
                                self.failedAuthentication = true
                            }
                        }
                    default:
                        print(error.self)
                        print(error.localizedDescription)
                }
            }
        }

        let FinalMinOriginal: Set<Int> = selectedIndicesFinal.subtracting(self.selectedIndicesOriginal)
        for idMiembro in FinalMinOriginal {
            let data = AgregarMiembroModel(idMiembro: idMiembro, idGrupo: idGrupo)
            let result : Result<APIResponseModel<MiembroAgregadoModel>, NetworkError> = await Webservice().postRequest("/grupos/usuario", with: data)

            switch result {
                case .success(let data):
                    print(data)
                    //return
                case .failure(let error):
                    switch error {
                        case .badStatus(let error, _):
                            if(error == 401){
                                DispatchQueue.main.async {
                                    self.failedAuthentication = true
                                }
                            }
                        default:
                            print(error.self)
                            print(error.localizedDescription)
                    }
            }
        }

        
    }



}
