//
//  WebService.swift
//  TECuido
//
//  Created by Alumno on 17/10/23.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
    case badResponse
    case decodingError
    case badStatus(error: Int)
    case invalidCredentials
    case serverError
}

enum ValidationError: Error {
    case error(description: String)
}

struct LoginRequestBody: Codable {
    let correo: String
    let password: String
}

struct RegisterRequestBody: Codable {
    let nombre: String
    let correo: String
    let password: String
    let idTipo: Int
}

struct RefreshRequestBody: Codable {
    let refreshToken: String
}

struct AuthResponse: Decodable {
    let message: String?
    let id: Int?
    let accessToken: String?
    let refreshToken: String?
}

struct ApiResponse<T: Decodable>: Decodable {
    let message: String?
    let data: T
}

struct AccessKeys: Codable {
    let id: Int
    let accessToken: String
    let refreshToken: String
}

class Webservice {
    
    let baseURL = "https://tecuido-server.onrender.com"
    let authManager = AuthManager.shared
    
    
    func getRequest<T: Decodable>(_ link: String, allowedRetry: Bool = true) async -> Result<T, NetworkError>{
        
        do {
            guard let url = URL(string: "\(baseURL)\(link)") else {
                throw NetworkError.invalidURL
            }
            
            var request = URLRequest(url: url)
        
            /*
            let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
            
            request.addValue("Bearer \(tokens.accessToken!)", forHTTPHeaderField: "Authorization")
             */
            
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.badResponse
            }
                        
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                if response.statusCode == 401 && allowedRetry {
                    /*
                    let token =  try await authManager.refreshToken(rToken: tokens.refreshToken as! String)
                     
                    let accessKeys = AccessKeys(id: tokens.id, accessToken: token.accessToken!, refreshToken: token.refreshToken!)
                    KeychainHelper.standard.save(accessKeys, service: "token", account: "tecuido.com")
                    
                    return await getRequest(link, allowedRetry: false)
                     */
                    
                }
                throw NetworkError.badStatus(error: response.statusCode)
            }
        
            guard let result = try? JSONDecoder().decode(T.self, from: data) else {
                throw NetworkError.decodingError
            }
            
            return .success(result)
        } catch NetworkError.invalidURL {
            return .failure(.invalidURL)
        } catch NetworkError.badResponse {
            return .failure(.badResponse)
        } catch NetworkError.badStatus(let error) {
            return .failure(.badStatus(error: error))
        } catch NetworkError.decodingError {
            return .failure(.decodingError)
        } catch {
            return .failure(.serverError)
        }
                        
    }
    
    func postRequest<T: Decodable, R: Codable>(_ link: String, with body: R, allowedRetry: Bool = true) async -> Result<T, NetworkError>{
            
            do {
                guard let url = URL(string: "\(baseURL)\(link)") else {
                    throw NetworkError.invalidURL
                }
                
                var request = URLRequest(url: url)
                
                /*
                let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self)!
                
                request.addValue("Bearer \(tokens.accessToken!)", forHTTPHeaderField: "Authorization")
                 */
                
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try? JSONEncoder().encode(body)
                
                
                let (data, response) = try await URLSession.shared.data(for: request)
                
                guard let response = response as? HTTPURLResponse else {
                    throw NetworkError.badResponse
                }
                            
                guard response.statusCode >= 200 && response.statusCode < 300 else {
                    if response.statusCode == 401 && allowedRetry {
                        /*
                        let token =  try await authManager.refreshToken(rToken: tokens.refreshToken as! String)
                         
                        let accessKeys = AccessKeys(id: tokens.id, accessToken: token.accessToken!, refreshToken: token.refreshToken!)
                        KeychainHelper.standard.save(accessKeys, service: "token", account: "tecuido.com")
                        
                        return await getRequest(link, allowedRetry: false)
                         */
                        
                    }
                    throw NetworkError.badStatus(error: response.statusCode)
                }
            
                guard let result = try? JSONDecoder().decode(T.self, from: data) else {
                    throw NetworkError.decodingError
                }
                
                return .success(result)
            } catch NetworkError.invalidURL {
                return .failure(.invalidURL)
            } catch NetworkError.badResponse {
                return .failure(.badResponse)
            } catch NetworkError.badStatus(let error) {
                return .failure(.badStatus(error: error))
            } catch NetworkError.decodingError {
                return .failure(.decodingError)
            } catch {
                return .failure(.serverError)
            }
                            
        }
    
    func login(correo: String, password: String) async -> Result<AuthResponse, NetworkError>{
        
        do {
            guard let url = URL(string: "\(baseURL)/login") else {
                throw NetworkError.invalidURL
            }
            
            let body = LoginRequestBody(correo: correo, password: password)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
            
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.badResponse
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                throw NetworkError.badStatus(error: response.statusCode)
            }
            
        
            guard let result = try? JSONDecoder().decode(AuthResponse.self, from: data) else {
                throw NetworkError.decodingError
            }
            
            guard let aToken = result.accessToken,
                  let rToken = result.refreshToken else {
                throw NetworkError.invalidCredentials
            }
            
            return .success(result)
        } catch NetworkError.invalidURL {
            return .failure(.invalidURL)
        } catch NetworkError.badResponse {
            return .failure(.badResponse)
        } catch NetworkError.badStatus(let error) {
            return .failure(.badStatus(error: error))
        } catch NetworkError.decodingError {
            return .failure(.decodingError)
        } catch {
            return .failure(.serverError)
        }
        
    }
    
    
    func register(nombre: String, correo:String, password: String, idTipo: Int) async -> Result<AuthResponse, NetworkError>{
        
        do {
            guard let url = URL(string: "\(baseURL)/registro") else {
                throw NetworkError.invalidURL
            }
            
            let body = RegisterRequestBody(nombre: nombre, correo:correo, password: password, idTipo: idTipo)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
            
            
            let (data, response) = try await URLSession.shared.data(for: request)
                        
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.badResponse
            }
            
                                    
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                throw NetworkError.badStatus(error: response.statusCode)
            }
            
        
            guard let result = try? JSONDecoder().decode(AuthResponse.self, from: data) else {
                throw NetworkError.decodingError
            }
            
            
            guard let aToken = result.accessToken,
                  let rToken = result.refreshToken else {
                throw NetworkError.invalidCredentials
            }
            
            return .success(result)
        } catch NetworkError.invalidURL {
            return .failure(.invalidURL)
        } catch NetworkError.badResponse {
            return .failure(.badResponse)
        } catch NetworkError.badStatus(let error) {
            return .failure(.badStatus(error: error))
        } catch NetworkError.decodingError {
            return .failure(.decodingError)
        } catch {
            return .failure(.serverError)
        }
        
    }
    
    func refreshToken(rToken: String) async -> Result<AuthResponse, NetworkError> {
        
        do {
            guard let url = URL(string: "\(baseURL)/refreshToken") else {
                throw NetworkError.invalidURL
            }
            
            let body = RefreshRequestBody(refreshToken: rToken)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
            
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.badResponse
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                throw NetworkError.badStatus(error: response.statusCode)
            }
            
        
            guard let result = try? JSONDecoder().decode(AuthResponse.self, from: data) else {
                throw NetworkError.decodingError
            }
            
            guard let aToken = result.accessToken,
                  let rToken = result.refreshToken else {
                throw NetworkError.invalidCredentials
            }
            
            return .success(result)
        } catch NetworkError.invalidURL {
            return .failure(.invalidURL)
        } catch NetworkError.badResponse {
            return .failure(.badResponse)
        } catch NetworkError.badStatus(let error) {
            return .failure(.badStatus(error: error))
        } catch NetworkError.decodingError {
            return .failure(.decodingError)
        } catch {
            return .failure(.serverError)
        }
        
    }
    
    
}
