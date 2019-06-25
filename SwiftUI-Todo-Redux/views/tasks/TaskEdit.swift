//
//  TaskEdit
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Combine
import SwiftUI

// Class to respond to keyboard events

final class KeyboardGuardian: BindableObject {
    let didChange = PassthroughSubject<Void, Never>()

    public var rects: [CGRect]
    public var keyboardRect: CGRect = CGRect()

    // keyboardWillShow notification may be posted repeatedly,
    // this flag makes sure we only act once per keyboard appearance
    public var keyboardIsHidden = true

    public var slide: Length = 0 {
        didSet {
            didChange.send()
        }
    }

    public var showField: Int = 0 {
        didSet {
            updateSlide()
        }
    }

    init(_ textFieldCount: Int = 0) {
        rects = [CGRect](repeating: CGRect(), count: textFieldCount)

        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if keyboardIsHidden {
            keyboardIsHidden = false
            if let rect = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
                keyboardRect = rect
                updateSlide()
            }
        }
    }

    @objc func keyBoardDidHide(notification _: Notification) {
        keyboardIsHidden = true
        updateSlide()
    }

    func updateSlide() {
        if keyboardIsHidden {
            slide = 0
        } else {
            let tfRect = rects[self.showField]
            let diff = keyboardRect.minY - tfRect.maxY

            if diff > 0 {
                slide += diff
            } else {
                slide += min(diff, 0)
            }
        }
    }
}

// Class to respond to editText commit, change responder / focus

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
    // @ObjectBinding private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    var task: Task?
    var _showEdit: Binding<Bool>? // Used to dismiss Modal presentation

    init(task _: Task? = nil, showEdit: Binding<Bool>? = nil) {
        print("TaskEdit init")
        _showEdit = showEdit
    }

    func doCancel() {
        print("Cancel edit")
        _showEdit?.value = false // Dismiss Modal presentation
    }

    func doSave() {
        print("Save edits")
        _showEdit?.value = false // Dismiss Modal presentation
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
            TaskEdit(task: sampleStore.tasksState.tasks[0])
                .environmentObject(sampleStore)
                .previewLayout(.fixed(width: 375, height: 1000))
        }
    }
#endif
