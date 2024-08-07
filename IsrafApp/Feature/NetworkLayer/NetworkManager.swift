//
//  NetworkManager.swift
//  IsrafApp
//
//  Created by Emre on 7.08.2024.
//

import Foundation
import FirebaseAuth

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func registerUser(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                completion(.success(authResult))
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                completion(.success(authResult))
            }
        }
    }
    
    func signOutUser(completion: @escaping (Result<Void, Error>) -> Void) {
            do {
                try Auth.auth().signOut()
                completion(.success(()))
            } catch let signOutError as NSError {
                completion(.failure(signOutError))
            }
        }
}
