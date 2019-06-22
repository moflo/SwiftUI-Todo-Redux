//
//  ContentView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Foundation

enum UserActions: Action {
    case addUser
    case deleteUser(index: Int)
    case move(from: Int, to: Int)
    case editUser(id: Int, name: String, username: String)
    case testEditFirstUser
    case startEditUser
    case stopEditUser
}

