//
//  TaskResponse.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Foundation

struct TaskResponseJSON: Codable {
    let id: Int
    let tasks: [Task]
}
