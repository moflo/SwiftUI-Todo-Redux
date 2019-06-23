//
//  ContentView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Foundation

struct UserActions {
    struct getUsers: Action {
        init() {
            APIService.shared.GET(endpoint: .users, params: nil) {
                (result: Result<UserResponseJSON, APIService.APIError>) in
                switch result {
                case let .success(response):
                    store.dispatch(action: UserAddResponse(id: response.id, response: response))
                case .failure:
                    break
                }
            }
        }
    }

    struct deleteUser: Action {
        init(index _: Int) {}
    }

    struct move: Action {
        init(from _: Int, to _: Int) {}
    }

    struct editUser: Action {
        init(id _: Int, name _: String, username _: String) {}
    }

    struct testEditFirstUser: Action {
        init() {}
    }

    struct startEditUser: Action {
        init() {}
    }

    struct stopEditUser: Action {
        init() {}
    }

    // MARK: Response Structs

    struct UserAddResponse: Action {
        let id: String
        let response: UserResponseJSON
    }
}
