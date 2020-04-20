//
//  Alert+UIViewController.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/9/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import UIKit
import Firebase

extension UIViewController {
    func showAlert(title: String, message: String,  complition: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: complition))
        self.present(alert, animated: true)
    }

    enum EditType: String {
        case email = "E-mail"
        case nickname = "Nickname"
        case bio = "Bio"
    }
    
    func showEditAlert(type: EditType, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "New \(type.rawValue)"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Change", style: .default, handler: { (_ ) in
            guard let text = alert.textFields?.first?.text else { return }
            switch type {
            case .email: Auth.auth().currentUser?.updateEmail(to: text) { (error) in
                if let error = error {
                    self.showAlert(title: "Sorry", message: error.localizedDescription)
                }
                }
            case .nickname: let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = text
            changeRequest?.commitChanges { (error) in
                if let error = error {
                    self.showAlert(title: "Sorry", message: error.localizedDescription)
                }
                }
            case .bio: print("asd")
//                Auth.auth().sendPasswordReset(withEmail: User.email) { error in
//                    if let error = error {
//                        self.showAlert(title: "Sorry", message: error.localizedDescription)
//                    }
//                }
            }
        }))
        self.present(alert, animated: true)
    }
}
