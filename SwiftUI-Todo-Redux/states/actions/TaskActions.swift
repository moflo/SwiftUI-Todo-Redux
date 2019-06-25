//
//  TaskActions.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Foundation

struct TaskActions {
    struct getTasks: Action {
        init() {
            DataStore.shared.GET(endpoint: .tasks, params: nil) {
                (result: Result<TaskResponseJSON, DataStore.APIError>) in
                switch result {
                case let .success(response):
                    store.dispatch(action: GetTaskResponse(id: 0, response: response))
                case .failure:
                    break
                }
            }
        }
    }

    struct deletTask: Action {
        init(index _: Int) {}
    }

    struct move: Action {
        init(from _: Int, to _: Int) {}
    }

    struct editTask: Action {
        init(id _: Int, name _: String, description _: String, owner _: User) {}
    }

    struct markTaskDone: Action {
        init(id _: Int) {}
    }

    struct testEditBlankTask: Action {
        init() {}
    }

    struct startEditTask: Action {
        init() {}
    }

    struct stopEditTask: Action {
        init() {}
    }

    // MARK: Response Structs

    struct GetTaskResponse: Action {
        let id: Int
        let response: TaskResponseJSON
    }

    struct Notification: Action {
        let show: Bool
        let message: String
    }
}
