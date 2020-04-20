//
//  MainViewController.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/13/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    private var database = FirebaseDatabaseModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTable()
        self.database.observePosts()
    }

    private func setupTable() {
        self.tabBarController?.navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData(notification:)), name: NSNotification.Name(rawValue: "refresh"), object: nil)
        self.tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        self.tableView.tableFooterView = UIView()
    }

    @IBAction func composePressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New post", message: "What whould you like to post?", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Message"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Post", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            let dateString = String(describing: Date())
            if !text.isEmpty && text.count <= 255 {
                let parameters = ["username" : MyProfile.defaultName,
                                  "message"  : text,
                                  "date"     : dateString]
                self.database.write(params: parameters)
            } else {
                self.showAlert(title: "Sorry", message: "The message have to be non empty and less than 255 characters")
            }})
        present(alert, animated: true)
    }

    @objc private func reloadData(notification: Notification) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - TableView's methods.

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
        let post = self.database.posts[indexPath.section]
        cell.setup(message: post.text, nickname: post.username, date: post.date)

        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.database.posts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear

        return view
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 10.0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "Actions", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Show \(self.database.posts[indexPath.section].username) profile", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true)
    }
}

