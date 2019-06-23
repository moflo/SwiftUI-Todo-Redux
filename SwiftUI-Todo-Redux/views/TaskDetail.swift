//
//  TaskDetail.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct TaskDetail: View {
    @EnvironmentObject var store: AppStore
    let task: Task

    var body: some View {
        VStack {
            if task.isDone == true {
                Text("Done")
            } else {
                Text("Not Done")
            }
            HStack(alignment: .leading, spacing: 8) {
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
            TaskDetail(task: sampleStore.tasksState.tasks[0]).environmentObject(sampleStore)
        }
    }
#endif
