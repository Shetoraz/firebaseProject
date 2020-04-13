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
    var date: String

    init?(postId: String, dict: [String:String]) {
        self.postId = postId

        guard let username = dict["username"],
            let text = dict["message"],
            let dateString = dict["date"]
            else { return nil }

        self.username = username
        self.text = text
        self.date = dateString
    }
}

