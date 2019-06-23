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

    init(usersState: UsersState = UsersState(), tasksState _: TasksState = TasksState()) {
        self.usersState = usersState
    }

    func dispatch(action: Action) {
        usersState = UserStateReducer().reduce(state: usersState, action: action)
        didChange.send(self)
    }

    func dispatch(action: Action) {
        var state = self.state
        state.usersState = UserStateReducer().reduce(state: state.usersState, action: action)
        state.tasksState = TaskStateReducer().reduce(state: state.tasksState, action: action)
        self.state = state
        DispatchQueue.main.async {
            self.didChange.send(self)
        }
    }
}

let store = AppState()

#if DEBUG
    let sampleStore = AppState(usersState: UsersState(users: testUsersModels), tasksStates: usersState: TasksState(tasks: testTasksModels))
#endif
