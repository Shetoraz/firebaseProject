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
                print("Change nickname alert")
            case 1:
                print("Change Bio")
            case 2:
                print("Change email")
            default:
                break
            }
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
        if indexPath.section == 1 {
            switch item {
            case 0:
                print("Log out")
            default:
                break
            }
        }
    }
}


