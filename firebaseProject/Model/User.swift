//
//  MyProfile.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/14/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import Foundation
import Firebase

class User {

    static var email: String?

    init(email: String?) {
        User.email = email
    }

    private static var defaultName : String = {
        var array = ["0","1","2","2","3","4","5","6","7","8","9"]
        var name = String()
        for i in 1...8 {
            name += array.randomElement()!
        }
        return "user" + name
    }()

    static var username: String {
        return Auth.auth().currentUser?.displayName ?? defaultName
    }
}
