//
//  AuthService.swift
//  EventApp
//
//  Created by Abdussalam Abdurakhimov on 07.05.2024.
//


import Foundation

struct Credentials: Encodable {
    let username: String
    let password: String
}

struct AuthResponse: Decodable {
    let token: String
}

class AuthService {
    static func login(username: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        let credentials = Credentials(username: username, password: password)
        guard let url = URL(string: "http://localhost:8000/api/login/") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(credentials)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            do {
                let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
                saveToken(authResponse.token) // Сохраняем токен
                completion(.success(authResponse.token))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    static func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "AuthToken") // Сохраняем токен в UserDefaults
    }
    
    static func getToken() -> String? {
        return UserDefaults.standard.string(forKey: "AuthToken") // Получаем токен из UserDefaults
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case noData
}
