//
//  ContentView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Foundation
import SwiftUI
import Combine



struct TasksState : FluxState {
    var tasks: [Task]
    var isEditingTask = false

    init(tasks: [Task] = []) {
        self.tasks = tasks
    }

}
