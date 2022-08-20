//
//  DataBaseManager.swift
//  MessageMeApp
//
//  Created by Anton Veldanov on 8/19/22.
//

import Foundation
import FirebaseDatabase


final class DataBaseManager {

    static let shared = DataBaseManager()
    private let database = Database.database().reference()
}

// MARK: - Account Management

extension DataBaseManager {

    public func userExists(with email: String, completion: @escaping (Bool)->Void) {
        database.child(email).observeSingleEvent(of: .value) { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }

    /// Inserts new user to database
    public func insertUser(with user: MessageMeAppUser) {
        database.child(user.email).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}

struct MessageMeAppUser {
    let firstName: String
    let lastName: String
    let email: String
//        let profilePictureURL: String
}

