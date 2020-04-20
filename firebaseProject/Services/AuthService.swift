//
//  FirebaseService.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/8/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import UIKit
import Firebase

class AuthService {

    static let postReference = Database.database().reference().child("posts")
    var handle: AuthStateDidChangeListenerHandle?

//    init() {
//        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            if let user = user {
//                self.user = User(uid: user.uid, email: user.email)
//            } else {
//                return nil
//            }
//        }
//    }

    static func signIn(with email: String?, password: String?, completion: @escaping (Result<String, Error>) -> Void) {
        if let email = email {
            if let password = password {
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if let user = result?.user.email {
                        completion(.success(user))
                    }
                    if let error = error {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
    
    static func signUp(with email: String?, password: String?, completion: @escaping (Result<String, Error>) -> Void) {
        if let email = email {
            if let password = password {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let user = result?.user.email {
                        completion(.success(user))
                    }
                    if let error = error {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}
