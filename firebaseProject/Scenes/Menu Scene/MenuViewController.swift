//
//  ViewController.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/8/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signUpPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "signUpSegue", sender: self)
    }

    @IBAction func signInPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "signInSegue", sender: self)
    }
    
}

