//
//  DefaultUsernameGenerator.swift
//  firebaseProject
//
//  Created by Anton Asetski on 4/15/20.
//  Copyright © 2020 Anton Asetski. All rights reserved.
//

import Foundation

class DefaultUsernameGenerator {

    static var shared = DefaultUsernameGenerator()

    private init() { }

    var array = ["0","1","2","2","3","4","5","6","7","8","9"]

    lazy var name: String = {
        var readyString = String()
        for _ in 1...8 {
            let randomIndex = Int.random(in: 0...array.count-1)
            readyString.append(array[randomIndex])
        }
        return "user\(readyString)"
    }()
}
