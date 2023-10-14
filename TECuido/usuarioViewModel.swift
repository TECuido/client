//
//  usuarioViewModel.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import Foundation
import SwiftUI

class usuarioViewModel : ObservableObject {
    
    func authenticate(correo: String, password: String, completion: @escaping (Bool) -> Void){
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
        
        URLSession.shared.dataTask(with: request){(data,response, error) in
            if let error = error {
                print("Hubo un error en la solicitud: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            if let data = data {
                if let httpResponsed = response as? HTTPURLResponse{
                    if httpResponsed.statusCode == 200{
                        completion(true)
                    }else{
                        completion(false)
                    }
                }else{
                    completion(false)
                }
            } else{
                completion(false)
            }
            
            
        }.resume()
        
        
    }
    
    
}

