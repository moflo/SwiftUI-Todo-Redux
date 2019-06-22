//
//  ContentView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Foundation

enum TaskActions: Action {
    case addTask
    case deletTask(index: Int)
    case move(from: Int, to: Int)
    case editTask(id: Int, name: String, description: String, owner: User)
    case markTaskDone(id: Int)
    case testEditBlankTask
    case startEditTask
    case stopEditTask
}

