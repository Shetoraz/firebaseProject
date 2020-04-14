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
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.2
        self.layer.cornerRadius = 20
        self.layer.shadowRadius = 5
    }
    
    func setup(message: String, nickname: String, date: String) {
        self.messageLabel.text = message
        self.nicknameLabel.text = nickname
        self.dateLabel.text = date
    }
}
