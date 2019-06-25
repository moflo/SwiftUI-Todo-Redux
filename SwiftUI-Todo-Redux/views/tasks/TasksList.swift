//
//  TasksList.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct TasksList: View {
    @EnvironmentObject var store: AppState
    @State var showEdit = false

    func loadPage() {
        print("loadPage")
        store.dispatch(action: TaskActions.getTasks())
    }

    var taskSection: some View {
        Section {
            ForEach(store.tasksState.tasks) { task in
                NavigationButton(destination: TaskDetail(task: task)) {
                    TasksRow(task: task)
                }
            }
        }
    }

    var taskEditModal: Modal {
        return Modal(TaskEdit(task: nil, isEditing: $showEdit).environmentObject(store))
    }

    var body: some View {
        NavigationView {
            List {
                taskSection

                NavigationButton(
                    destination: TaskEdit(task: nil, isEditing: $showEdit),
                    label: { Text("Add") }
                )
            }
            .navigationBarTitle(Text("My Tasks"))
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                HStack {
                                    Button(action: { self.showEdit.toggle() }, label: { Text("Add1") })
                                    NavigationButton(
                                        destination: TaskEdit(task: nil, isEditing: $showEdit),
                                        label: { Text("Add2") }
                                    )
            })
            .presentation(self.showEdit ? self.taskEditModal : nil)
            .onAppear {
                self.loadPage()
            }
        }
    }
}

#if DEBUG
    struct TasksList_Previews: PreviewProvider {
        static var previews: some View {
            TasksList().environmentObject(sampleStore)
        }
    }
#endif
