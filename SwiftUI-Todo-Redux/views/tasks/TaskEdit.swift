//
//  TaskEdit
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct FieldSetText: View {
    var label: String
    var placeHolder: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            TextField(.constant(""), placeholder: Text(placeHolder))
                .padding(.all)
                .background(Color("form-field-background"), cornerRadius: 5.0)
        }
        .padding(.horizontal, 15)
    }
}

struct RoundedButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Save")
                    .font(.headline)
                    .color(Color.white)
                Spacer()
            }
        }
        .padding(.vertical, 10.0)
        .background(Color.green, cornerRadius: 8.0)
        .padding(.horizontal, 40)
    }
}

struct TaskEdit: View {
    @EnvironmentObject var store: AppState
    let task: Task

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Information")) {
                    VStack(alignment: .leading) {
                        FieldSetText(label: "TITLE", placeHolder: "Task title")
                        FieldSetText(label: "DESCRIPTION", placeHolder: "Task description")
                    }
                    .padding(.vertical, 20)
                    .listRowInsets(EdgeInsets())
                }
                Section(header: Text("Task Owner")) {
                    VStack(alignment: .leading) {
                        FieldSetText(label: "OWNER", placeHolder: "Task owner")
                    }
                    .padding(.vertical, 20)
                    .listRowInsets(EdgeInsets())
                }

                RoundedButton().padding(.vertical, 20)
            }

            .navigationBarTitle(Text("New Task"))
            .navigationBarItems(leading:
                Button(action: {}, label: {
                    Text("Cancel")
                }), trailing:
                Button(action: {}, label: {
                    Text("Save")
            }))
        }
    }
}

#if DEBUG
    struct TasksEdit_Previews: PreviewProvider {
        static var previews: some View {
            TaskEdit(task: sampleStore.tasksState.tasks[0])
                .environmentObject(sampleStore)
                .previewLayout(.fixed(width: 375, height: 1000))
        }
    }
#endif
