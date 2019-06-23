//
//  User.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct User: Equatable, Hashable, Codable, Identifiable {
    let id: Int
    var name: String
    var username: String
    let imageName = "person"
}

let testUsersModels = [User(id: 0, name: "user 1", username: "@user1"),
                       User(id: 1, name: "user 2", username: "@user2")]
