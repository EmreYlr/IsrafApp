//
//  NetworkManager.swift
//  IsrafApp
//
//  Created by Emre on 7.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    private let db = Firestore.firestore()
    
    func registerUser(email: String, password: String, firstName: String, lastName: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                let uid = authResult.user.uid
                let userData: [String: Any] = [
                    "firstName": firstName,
                    "lastName": lastName,
                    "email": email,
                    "createdAt": Timestamp(date: Date())
                ]
                self.db.collection("users").document(uid).setData(userData) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(()))
                    }
                }
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
    
    func getUserInfo(uid: String, completion: @escaping (Result<User, Error>) -> Void) {
        let userRef = db.collection("users").document(uid)
        
        userRef.getDocument { document, _ in
            guard let document = document, document.exists, let data = document.data(), let user = User(data: data) else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to get user data"])))
                return
            }
            completion(.success(user))
        }
    }
    
    func fetchFoods(completion: @escaping ([Food]?) -> Void) {
        db.collection("foods").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error)")
                completion(nil)
            } else {
                var foods = [Food]()
                for document in snapshot!.documents {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: document.data(), options: [])
                        let food = try JSONDecoder().decode(Food.self, from: jsonData)
                        foods.append(food)
                    } catch let error {
                        print("Error decoding document: \(error)")
                    }
                }
                completion(foods)
            }
        }
    }
    
}
