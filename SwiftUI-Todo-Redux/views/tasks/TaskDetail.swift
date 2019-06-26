//
//  TaskDetail.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

// Based on "in-line" detail editing structure proposed by Apple
/// https://developer.apple.com/tutorials/swiftui/working-with-ui-controls

struct TaskDetail: View {
    @EnvironmentObject var store: AppState

    @Environment(\.editMode) var mode
    @State var task: Task
    /// Value of `draftTask` is set to `task` using the Form `.onAppear` call
    @State var draftTask: Task = Task(title: "placeholder", isDone: false)
    @State var ownerName: String = ""

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

    var TaskEdit: some View {
        Form {
            Section(header: Text("Task Information")) {
                VStack(alignment: .leading) {
                    FieldSetText(textItem: $draftTask.title, label: "TITLE", placeHolder: "Task title")
                }
                .padding(.vertical, 20)
                .listRowInsets(EdgeInsets())
            }
            Section(header: Text("Task Owner")) {
                VStack(alignment: .leading) {
                    FieldSetText(textItem: $ownerName, label: "OWNER", placeHolder: "Task owner")
                }
                .padding(.vertical, 20)
                .listRowInsets(EdgeInsets())
            }

            RoundedButton().padding(.vertical, 20)
        }
        .onAppear(perform: { self.draftTask = self.task })
    }

    var body: some View {
        ZStack(alignment: .top) {
            HStack {
                if self.mode?.value == .active {
                    Button(action: {
                        self.mode?.animation().value = .inactive
                        // Update current taskID
                        self.task = self.draftTask
                        // store.dispatch(aciton: TaskActions.updateTask(id: task.id, task: draftTask))
                        self.store.dispatch(action: TaskActions.Notification(show: true, message: "Changes saved"))

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
                TaskEdit
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
