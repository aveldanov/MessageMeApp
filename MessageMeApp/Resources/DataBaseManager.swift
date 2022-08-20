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
        let safeEmail = email.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
        database.child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            print(snapshot.children, email, snapshot.value)
            guard snapshot.value as? String != nil else {
                completion(true)
                return
            }
            completion(false)
        })
    }

    /// Inserts new user to database
    public func insertUser(with user: MessageMeAppUser) {
        database.child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}

struct MessageMeAppUser {
    let firstName: String
    let lastName: String
    let email: String

    var safeEmail: String {
        let safeEmail = email.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }

//        let profilePictureURL: String
}

