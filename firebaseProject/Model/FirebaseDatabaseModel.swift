//
//  FirebaseDatabaseModel.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/8/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import Foundation
import Firebase

class FirebaseDatabaseModel {

    var posts = [Post]()

    private var data: DatabaseReference

    init() {
        self.data = Database.database().reference()
    }

    func write(params: [String : String]) {
        self.data.child("posts").childByAutoId().setValue(params)
    }

    func observePosts() {
        self.data.child("posts").observe(.value) { (snapshot) in
            AuthService.postReference.observe(.value) { (snapshot) in
                guard let postShapshot = PostSnapshot(with: snapshot) else { return }
                self.posts = postShapshot.posts
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "HH:mm/d MMM"
                self.posts.sort(by: { dateFormatter.date(from:$0.date)?.compare(dateFormatter.date(from:$1.date)!) == .orderedAscending })
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refresh"), object: nil)
        }
    }
}
