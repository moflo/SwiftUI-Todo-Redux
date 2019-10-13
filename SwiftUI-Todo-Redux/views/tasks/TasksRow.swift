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
//                    .font(.largeTitle)
                    .imageScale(.large)
                    .foregroundColor(.green)
            } else {
                Image(systemName: "checkmark.circle")
//                    .font(.largeTitle)
                    .imageScale(.large)
                    .foregroundColor(.gray)
            }
            VStack(alignment: .leading, spacing: CGFloat(8.0)) {
                Text(task.title).font(.title)
                Text(task.id)
                    .foregroundColor(.secondary)
            }.padding(.leading, CGFloat(8.0))
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
