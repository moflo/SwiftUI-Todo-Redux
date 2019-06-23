//
//  ContentView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Foundation

struct UserStateReducer: Reducer {
    func reduce(state: UsersState, action: Action) -> UsersState {
        var state = state

        if let action = action as? UserActions.UserAddResponse {
            let id = action.id
            let user = action.response.user
            state.users.append(user)
        }

        if let action = action as? UserActions.UserDeleteResponse {
            let id = action.id
            state.users.remove(at: id)
        }

        if let action = action as? UserActions.UserMoveResponse {
            let from = action.from
            let to = action.to
            let user = state.users.remove(at: from)
            state.users.insert(user, at: to)
        }

        if let action = action as? UserActions.EditUserResponse {
            let id = action.id
            let user = action.response.user
            state.users[id] = user
        }

        if let action = action as? UserActions.TestEditResponse {
            if !state.users.isEmpty {
                state.users[0] = User(id: 0, name: "user1", username: "u\ns\ne\nr\nn\na\nm\ne")
            }
        }

        if let action = action as? UserActions.startEditUser {
            state.isEditingUser = true
        }

        if let action = action as? UserActions.stopEditUser {
            state.isEditingUser = false
        }

        return state
    }
}
