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

    var body: some View {
        NavigationView {
            List {
                taskSection
            }
            .navigationBarTitle(Text("My Tasks"))
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
