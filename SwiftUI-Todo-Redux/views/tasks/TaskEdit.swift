//
//  TaskEdit
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Combine
import SwiftUI


struct TaskEdit: View {
    @EnvironmentObject var store: AppState
    // @ObjectBinding private var kGuardian = KeyboardObserver(textFieldCount: 1)
    var task: Task?
    @Binding var isEditing: Bool // Used to dismiss Modal presentation

    func doCancel() {
        isEditing = false // Dismiss Modal presentation
    }

    func doSave() {
        isEditing = false // Dismiss Modal presentation
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Information")) {
                    VStack(alignment: .leading) {
                        FieldSetText(label: "TITLE", placeHolder: "Task title")
                        FieldSetText(label: "DESCRIPTION", placeHolder: "Task description")

                        FieldSetText(label: "DUMMY", placeHolder: "dummy placeholder")
                        FieldSetText(label: "DUMMY", placeHolder: "dummy placeholder")
                        FieldSetText(label: "DUMMY", placeHolder: "dummy placeholder")
                        FieldSetText(label: "DUMMY", placeHolder: "dummy placeholder")
                        FieldSetText(label: "DUMMY", placeHolder: "dummy placeholder")
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
            return TaskEdit(task: sampleStore.tasksState.tasks[0], isEditing: .constant(true))
                .environmentObject(sampleStore)
                .previewLayout(.fixed(width: 375, height: 1000))
        }
    }
#endif
