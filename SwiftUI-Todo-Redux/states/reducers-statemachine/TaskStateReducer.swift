//
//  ContentView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Foundation

struct TaskStateReducer: Reducer {
    func reduce(state: TasksState, action: Action) -> TasksState {
        guard let action = action else { return state }

        var state = state
        switch action {
        case TaskActions.addTask:
            state.tasks.append(Task(id: state.tasks.count,
                                    name: "New task \(state.tasks.count + 1)",
                                    taskname: "@newtask\(state.tasks.count + 1)"))

        case let TaskActions.deletTask(index):
            state.tasks.remove(at: index)

        case let TaskActions.move(from, to):
            let task = state.tasks.remove(at: from)
            state.tasks.insert(task, at: to)

        case let TaskActions.editTask(id, name, description, owner):
            var task = state.tasks[id]
            task.name = name
            task.taskname = taskname
            state.tasks[id] = task

        case let TaskActions.markTaskDone(id):
            var task = state.tasks[id]
            task.isDone.toggle()

        case TaskActions.testEditBlankTask:
            if !state.tasks.isEmpty {
                state.tasks[0] = Task(id: 0, name: "task1", taskname: "u\ns\ne\nr\nn\na\nm\ne")
            }

        case TaskActions.startEditTask:
            state.isEditingtask = true

        case TaskActions.stopEditTask:
            state.isEditingtask = false

        default:
            break
        }
        return state
    }
}
