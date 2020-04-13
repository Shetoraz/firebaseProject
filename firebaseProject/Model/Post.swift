//
//  Post.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/12/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import Foundation

struct Post {
    var postId: String
    var username: String
    var text: String
    var date: Date

    init?(postId: String, dict: [String:Any]) {
        self.postId = postId

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        guard let username = dict["username"] as? String,
            let text = dict["message"] as? String,
            let dateString = dict["date"] as? String,
            let date = dateFormatter.date(from: dateString)
            else { return nil }

        self.username = username
        self.text = text
        self.date = date
    }
}

