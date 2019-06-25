//
//  TasksState.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

struct TasksState: FluxState {
    var tasks: [Task]
    var hasTaskError = false
    var taskErrorMessage = ""

    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
}
