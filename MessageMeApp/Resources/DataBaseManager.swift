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



    public func test() {

        database.child("foo").setValue(["something": true])

    }







}
