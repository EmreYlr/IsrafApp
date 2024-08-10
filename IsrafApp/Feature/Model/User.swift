//
//  User.swift
//  IsrafApp
//
//  Created by Emre on 8.08.2024.
//

import Foundation
import FirebaseFirestore

struct User {
    let firstName: String
    let lastName: String
    let email: String
    let createdAt: Date
    
    init?(data: [String: Any]) {
        guard let firstName = data["firstName"] as? String,
              let lastName = data["lastName"] as? String,
              let email = data["email"] as? String,
              let timestamp = data["createdAt"] as? Timestamp else {
            return nil
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.createdAt = timestamp.dateValue()
    }
}
