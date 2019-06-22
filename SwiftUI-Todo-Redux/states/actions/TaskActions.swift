//
//  ContentView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Foundation

struct TaskActions{

    struct addTask : Action {
        init() {
            APIService.shared.GET(endpoint: .credits(movie: movie), params: nil) {
                (result: Result<CastResponse, APIService.APIError>) in
                switch result {
                case let .success(response):
                    store.dispatch(action: SetMovieCasts(movie: movie, response: response))
                case .failure(_):
                    break
                }
            }

        }
    }

    struct deletTask : Action {
        init(index: Int) {

        }
    }
    
    struct move : Action {
        init(from: Int, to: Int) {

        }
    }

    struct editTask : Action {
        init(id: Int, name: String, description: String, owner: User) {

        }
    }

    struct markTaskDone : Action {
        init(id: Int) {

        }
    }

    struct testEditBlankTask : Action {
        init() {

        }
    }

    struct startEditTask : Action {
        init() {

        }
    }

    struct stopEditTask : Action {
        init() {

        }
    }

    // MARK: Response Structs

    struct SetMovieCasts: Action {
        let movie: Int
        let response: CastResponse
    }

}

