//
//  ProfileViewController.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/18/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {

    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addObserve()
        self.tableView.tableFooterView = UIView()
    }

    @objc private func refreshCells(notification: Notification) {
        DispatchQueue.main.async {
            self.nicknameLabel.text = User.username
            self.bioLabel.text = User.username
            self.emailLabel.text = User.email
        }
    }

    private func addObserve() {
        self.nicknameLabel.text = User.username
        self.emailLabel.text = User.email
        NotificationCenter.default.addObserver(self, selector: #selector(refreshCells(notification:)), name: NSNotification.Name(rawValue: "refreshCells"), object: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = indexPath.row
        if indexPath.section == 0 {
            switch item {
            case 0:
                print("Change avatar")
            case 1:
                showEditAlert(type: .nickname)
            case 2:
                showEditAlert(type: .email)
            default:
                break
            }
        }
        if indexPath.section == 1 {
            switch item {
            case 0:
                AuthService.logOut { (result) in
                    switch result {
                    case .success(_ ):
                        print("Changed")
                    //move to menu vc
                    case .failure(let error):
                        self.showAlert(title: "Sorry", message: error.localizedDescription)
                    }
                }
            case 1:
                AuthService.delete()
            default:
                break
            }
        }
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

