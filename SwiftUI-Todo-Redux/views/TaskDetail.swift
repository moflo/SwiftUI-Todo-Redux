//
//  TaskDetail.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct TaskDetail: View {
    @EnvironmentObject var store: AppState
    let task: Task

    var body: some View {
        VStack {
            Text("TaskDetail")
            AnyView(
                Text(task.title).font(.title))
            AnyView(
                Text(task.id)
            )
            if task.isDone {
                Text("Done")
            } else {
                Text("Not Done")
            }
        }
    }
}

#if DEBUG
    struct TasksDetail_Previews: PreviewProvider {
        static var previews: some View {
            TaskDetail(task: sampleStore.tasksState.tasks[0]).environmentObject(sampleStore)
        }
    }
#endif
