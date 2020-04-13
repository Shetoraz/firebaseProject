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

    var posts = [Post]()

    enum Sections: String {
        case Users = "users"
    }

    private var data: DatabaseReference

    init() {
        self.data = Database.database().reference()
    }

    func write(section: Sections, user: String, text: String) {
        self.data.child(section.rawValue).child(user).setValue(text)
    }
}

