//
//  AuthManager.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//



enum AuthError: Error {
    case missingToken
}

struct Token: Decodable {
    let accessToken: String
    let refreshToken: String
}

struct RefreshBody: Codable {
    let refreshToken: String
}

actor AuthManager {
    private var refreshTask: Task<Token, Error>?
    
    static let shared = AuthManager()
    
    
    func refreshToken(rToken: String) async throws -> Token {
        //if there is a running task return its result
        if let refreshTask = refreshTask {
            return try await refreshTask.value
        }
    
        //else create a new task to get a refresh token
        let task = Task{ () throws -> Token in
            defer { refreshTask = nil }
            
            
            let response = await Webservice().refreshToken(rToken: rToken)
            
            switch(response){
                case .success(let token):
                    let newToken = Token(accessToken: token.accessToken!, refreshToken: token.refreshToken!)
                    return newToken
                case .failure(_):
                throw AuthError.missingToken
            }
                        
        }
        self.refreshTask = task
        
        //return the result of the task
        return try await task.value
    }
}


