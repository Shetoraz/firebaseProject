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

    enum Sections: String {
        case posts = "posts"
    }

    var posts = [Post]()

    private var data: DatabaseReference

    init() {
        self.data = Database.database().reference()
    }

    func write(section: Sections, params: [String : String]) {
        self.data.child(section.rawValue).childByAutoId().setValue(params)
    }

    func observePosts() {
        self.data.child("posts").observe(.value) { (snapshot) in
            FirebaseService.shared.postReference.observe(.value) { (snapshot) in
                guard let postShapshot = PostSnapshot(with: snapshot) else { return }
                self.posts = postShapshot.posts
                self.posts.sort(by: { $0.date.compare($1.date) == .orderedAscending })
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refresh"), object: nil)
        }
    }
}
