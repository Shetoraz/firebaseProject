//
//  LoginViewController.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/8/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signInPressed(_ sender: UIButton) {
        FirebaseService.shared.signIn(with: emailField.text, password: passwordField.text) { result in
            switch result {
            case .success(_ ):
                self.performSegue(withIdentifier: "loginDone", sender: self)
                self.cleanFields()
            case .failure(let error):
                self.showAlert(title: "Sorry", message: error.localizedDescription)
            }
        }
    }

    func cleanFields() {
           self.emailField.text = ""
           self.passwordField.text = ""
       }
}



