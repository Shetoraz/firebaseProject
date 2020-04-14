//
//  MyProfile.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/14/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import Foundation
import Firebase

class MyProfile {

    static var username: String {
        get {
            return Auth.auth().currentUser?.displayName ?? ""
        }
    }

    static var email: String {
        get {
            return Auth.auth().currentUser?.email ?? ""
        }
    }
}
