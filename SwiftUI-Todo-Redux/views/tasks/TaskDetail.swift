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

    @Environment(\.editMode) var mode
    @State var draftTask = Task(title: "New task", isDone: false)

    var TaskSummary: some View {
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

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.value == .active {
                    Button(action: {
                        self.mode?.animation().value = .inactive
                    }) {
                        Text("Save")
                    }
                }

                Spacer()

                EditButton()
            }
            if self.mode?.value == .inactive {
                TaskSummary
            } else {
                TaskEdit(task: $draftTask).environmentObject(store)
            }
        }
        .padding()
    }
}

#if DEBUG
    struct TasksDetail_Previews: PreviewProvider {
        static var previews: some View {
            TaskDetail(task: sampleStore.tasksState.tasks[0]).environmentObject(sampleStore)
        }
    }
#endif
