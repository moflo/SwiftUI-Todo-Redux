//
//  ContentView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

struct UsersState: FluxState {
    var users: [User]
    var isEditingUser = false

    init(users: [User] = []) {
        self.users = users
    }
}
