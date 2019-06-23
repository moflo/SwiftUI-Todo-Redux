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

final class AppState: BindableObject {
    var didChange = PassthroughSubject<AppState, Never>()

    var usersState: UsersState
    var tasksState: TasksState

    init(usersState: UsersState = UsersState(), tasksState: TasksState = TasksState()) {
        self.usersState = usersState
        self.tasksState = tasksState
    }

    func dispatch(action: Action) {
        self.usersState = UserStateReducer().reduce(state: self.usersState, action: action)
        self.tasksState = TaskStateReducer().reduce(state: self.tasksState, action: action)
        DispatchQueue.main.async {
            self.didChange.send(self)
        }
    }
}

let store = AppState()

#if DEBUG
    let sampleStore = AppState(
            usersState: UsersState(users: testUsersModels),
            tasksState: TasksState(tasks: testTasksModels))
#endif
