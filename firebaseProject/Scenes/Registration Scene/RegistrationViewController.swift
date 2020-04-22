//
//  RegistrationViewController.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/8/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func registerPressed(_ sender: UIButton) {
        FirebaseService.shared.signUp(with: emailField.text, password: passwordField.text) {
            switch $0 {
            case .success(let email):
                self.showAlert(title: "Success", message: email) { (_ ) in
                    self.performSegue(withIdentifier: "registerDone", sender: self)
                    self.cleanFields()
                    guard let navigationController = self.navigationController else { return }
                    var navigationArray = navigationController.viewControllers
                    navigationArray.remove(at: navigationArray.count - 2)
                    self.navigationController?.viewControllers = navigationArray
                }
            case .failure(let error):
                self.showAlert(title: "Success", message: error.localizedDescription) { (_ ) in
                    self.cleanFields()
                }
            }
        }
    }

    func cleanFields() {
        self.emailField.text = ""
        self.passwordField.text = ""
    }
}
