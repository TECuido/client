//
//  usuarioViewModel.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//
import Foundation
import SwiftUI
class UsuarioViewModel : ObservableObject {
    @Published var statusCode: Int = 0
    @Published var message: String = ""
    
    func authenticate(correo: String, password: String) async {

        // Pedimos los datos para guardalos
        let userData = ["correo": correo, "password":password]
        // se manda la requesr
        guard let url = URL(string: "https://tecuido-server.onrender.com/login")
        else{
            print("Url invalido")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: userData){
            request.httpBody = jsonData
        }else{
            print("Error de conversion de datos en JSON")
            return
        }
        
        //Realizar la llamada con URLSession
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let statCod = (response as? HTTPURLResponse)?.statusCode {
                //decodificar la informacion de formato JSON
                let results = try JSONDecoder().decode(ApiResponseModel.self, from:data)
                //utilizamos el thread principal para actualizar la variable de Photos
                DispatchQueue.main.async {
                    self.statusCode = statCod
                }
                if(results.message != "ok"){
                    DispatchQueue.main.async {
                        self.message = results.message
                    }
                }
            } else {
                print("Hubo un error en la solicitud")
                DispatchQueue.main.async {
                    self.message = "Ocurrió un error. Vuelve a intentarlo más tarde."
                }
                return
            }
        } catch {
            print("Error del servidor")
            return
        }
    }
}
