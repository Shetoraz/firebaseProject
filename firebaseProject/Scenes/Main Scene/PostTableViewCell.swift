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
    @IBOutlet private weak var back: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.back.layer.cornerRadius = 10
    }
    
    func setup(message: String, nickname: String, date: String) {
        self.messageLabel.text = message
        self.nicknameLabel.text = nickname
        self.dateLabel.text = date
    }
}
