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

    private init() {}
    
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

    static func logOut( completion: () ) {
        do {
            try Auth.auth().signOut()
        } catch(let error) {
            print(error.localizedDescription)
        }
    }

    static func delete() {
        Auth.auth().currentUser?.delete(completion: { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        })
    }
}
