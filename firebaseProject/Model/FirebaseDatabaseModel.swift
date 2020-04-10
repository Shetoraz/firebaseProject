//
//  FirebaseDatabaseModel.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/8/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import Foundation
import Firebase

class FirebaseDatabaseModel {

    enum Sections: String {
        case Users = "users"
    }

    private var data: DatabaseReference

    init() {
        self.data = Database.database().reference()
    }

    func write(section: Sections.RawValue, user: String, text: String) {
        self.data.child(section).child(user).setValue(text)
    }

    // MARK: - Beta 
    func read(username: String) throws -> String? {
        var value: String?
        self.data.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? [String:String] {
                value = data[username]
            }
        }
        return value
    }
}

