//
//  ContentView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct Task: Equatable, Hashable, Codable, Identifiable {
    let id: UUID
    var title: String
    var isDone: Bool
    var owner: User?

    init(title: String, isDone: Bool, owner :User? = nil) {
        id = UUID()
        self.title = title
        self.isDone = isDone
        self.owner = owner
    }
}

let testTasksModels = [Task(title: "task 1", isDone: true),
                       Task(title: "task 2", isDone: false)]
