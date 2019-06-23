//
//  TasksRow.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct TasksRow: View {
    @EnvironmentObject var store: AppStore
    let task: Task

    var body: some View {
        HStack {
            if task.isDone == true {
                Text("Done")
            } else {
                Text("Not Done")
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(task.title).font(.title)
                Text(task.id)
                    .color(.secondary)
            }.padding(.leading, 8)
        }.padding(8)
    }
}

#if DEBUG
    struct TasksList_Previews: PreviewProvider {
        static var previews: some View {
            TasksRow(task: sampleStore.tasksState.tasks[0]).environmentObject(sampleStore)
        }
    }
#endif
