//
//  Alert+UIViewController.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/9/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String,  complition: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: complition))
        self.present(alert, animated: true)
    }
}
