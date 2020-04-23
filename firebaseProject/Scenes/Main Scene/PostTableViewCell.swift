//
//  PostTableViewCell.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/14/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    // FIXME: - Add avatar
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var nicknameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.messageLabel.layer.masksToBounds = true
        self.messageLabel.layer.cornerRadius = 8
        self.messageLabel.font = UIFont.boldSystemFont(ofSize: 17)
        self.messageLabel.backgroundColor = UIColor(red: 129/255, green: 212/255, blue: 250/244, alpha: 1)
    }
    
    func setup(message: String, nickname: String, date: String) {
        self.messageLabel.text = message
        self.nicknameLabel.text = nickname
        self.dateLabel.text = date
    }
}
