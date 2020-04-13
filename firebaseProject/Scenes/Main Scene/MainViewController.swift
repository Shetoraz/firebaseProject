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
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData(notification:)), name: NSNotification.Name(rawValue: "refresh"), object: nil)
        self.tableView.tableFooterView = UIView()
    }

    @IBAction func composePressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New post", message: "What would you like to post?", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter message here"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let post = UIAlertAction(title: "Post", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            let dateString = String(describing: Date())

            let parameters = ["username" : "@sss",
                              "message"  : text,
                              "date"     : dateString]

            self.database.write(section: .posts, params: parameters)
        }
        alert.addAction(cancel)
        alert.addAction(post)
        present(alert, animated: true)
    }

    @objc private func reloadData(notification: Notification) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - TableView's methods.

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // FIXME: - Create custom cell
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = self.database.posts[indexPath.section].username
        cell.detailTextLabel?.text = self.database.posts[indexPath.section].text

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
        return 30.0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

