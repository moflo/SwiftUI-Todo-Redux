//
//  TaskCreate
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Combine
import SwiftUI

// Task Creation View, presented via a call to Modal()
/// Use the `@Binding` variables to dismiss this Modal

struct TaskCreate: View {
    @EnvironmentObject var store: AppState
    // @ObjectBinding private var kGuardian = KeyboardObserver(textFieldCount: 1)

    /// Default task
    @State var task: Task = Task(title: "New task", isDone: false)
    @State var ownerName: String = ""

    /// Used to dismiss Modal presentation
    @Binding var isEditing: Bool

    /// Dismiss Modal presentation
    func doCancel() {
        isEditing = false
    }

    /// Dismiss Modal presentation, save updated task if valid
    func doSave() {
        isEditing = false
        store.dispatch(action: TaskActions.Notification(show: true, message: "New Task Created!"))
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Information")) {
                    VStack(alignment: .leading) {
                        FieldSetText(textItem: $task.title, label: "TITLE", placeHolder: "Task title")
//                        FieldSetText(textData: .constant(""), label: "DESCRIPTION", placeHolder: "Task description")
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
            // .offset(y: kGuardian.slide).animation(.basic(duration: 1.0))
            .navigationBarTitle(Text("New Task"))
            .navigationBarItems(leading:
                Button(action: doCancel, label: {
                    Text("Cancel")
                }), trailing:
                Button(action: doSave, label: {
                    Text("Save")
            }))
        }
    }
}

#if DEBUG
    struct TasksEdit_Previews: PreviewProvider {
        static var previews: some View {
            return TaskCreate(isEditing: .constant(true))
                .environmentObject(sampleStore)
                .previewLayout(.fixed(width: 375, height: 1000))
        }
    }
#endif
