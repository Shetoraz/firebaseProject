//
//  PostSnapshot.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/13/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import Foundation
import Firebase

struct PostSnapshot {
    
    let posts: [Post]

    init?(with snapshot: DataSnapshot) {
        var posts = [Post]()
        guard let snapDict = snapshot.value as? [String: [String: String]] else { return nil }
        for snap in snapDict {
            guard let post = Post(postId: snap.key, dict: snap.value) else { continue }
            posts.append(post)
        }
        self.posts = posts
    }
}
