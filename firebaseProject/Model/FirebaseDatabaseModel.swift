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
    
    var data = DatabaseReference()

    init() {
        self.data = self.data.database.reference()
    }
}

