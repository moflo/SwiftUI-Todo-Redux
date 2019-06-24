//
//  TasksRow.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct TasksRow: View {
    @EnvironmentObject var store: AppState
    let task: Task

    var body: some View {
        HStack {
            if task.isDone {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.green)
            } else {
                Image(systemName: "checkmark.circle")
                    .font(.system(size: 60))
                .foregroundColor(.gray)
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
    struct TasksRow_Previews: PreviewProvider {
        static var previews: some View {
            Group {
            TasksRow(task: Task(title: "New Task", isDone: true)).environmentObject(sampleStore)
                
                TasksRow(task: Task(title: "New Task", isDone: false)).environmentObject(sampleStore)
            }
        }
    }
#endif
