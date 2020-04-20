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

    private static var array = ["0","1","2","2","3","4","5","6","7","8","9"]

    static var defaultName: String = {
        var readyString = String()
        for _ in 1...8 {
            let randomIndex = Int.random(in: 0...array.count-1)
            readyString.append(array[randomIndex])
        }
        return "user\(readyString)"
    }()
    
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

//    static func rename(text: String, handler: @escaping (Result<Bool, Error>) -> Void) {
//        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//        changeRequest?.displayName = text
//        changeRequest?.commitChanges { (error) in
//            handler(.failure(error))
//        }
//    }
}
