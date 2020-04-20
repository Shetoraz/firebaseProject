//
//  ProfileViewController.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/18/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = indexPath.row
        if indexPath.section == 0 {
            switch item {
            case 0:
                showEditAlert(type: .nickname)
            case 1:
                showEditAlert(type: .bio)
            case 2:
                showEditAlert(type: .email)
            default:
                break
            }
        }
        if indexPath.section == 1 {
            switch item {
            case 0:
                User.logOut { (result) in
                    switch result {
                    case .success(_ ):
                        print("Changed")
                        //move to menu vc
                    case .failure(let error):
                        self.showAlert(title: "Sorry", message: error.localizedDescription)
                    }
                }
            case 1:
                User.delete()
            default:
                break
            }
        }
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
