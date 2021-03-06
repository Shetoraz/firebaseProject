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
    private var handle: AuthStateDidChangeListenerHandle?
    private var user: User?

    init() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            print("Status changed")
            if let user = user {
                self.user = User(email: user.email)
            }
        }
    }

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

    static func logOut(handler: @escaping (Result<Bool, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            handler(.success(true))
        } catch(let error) {
            handler(.failure(error))
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
