//
//  UserCreate
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Combine
import SwiftUI

// User Creation View, presented via a call to Modal()
/// Use the `@Binding` variables to dismiss this Modal

struct UserCreate: View {
    @EnvironmentObject var store: AppState
    // @ObjectBinding private var kGuardian = KeyboardObserver(textFieldCount: 1)

    /// Default user
    @State var user: User = User(id: 0, name: "", username: "")

    /// Used to dismiss Modal presentation
    @Binding var isEditing: Bool

    /// Dismiss Modal presentation
    func doCancel() {
        isEditing = false
    }

    /// Dismiss Modal presentation, save updated user if valid
    func doSave() {
        isEditing = false
        self.store.dispatch(action: TaskActions.Notification(show: true, message: "New User Created!"))
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Information")) {
                    VStack(alignment: .leading) {
                    FieldSetText(textItem: $user.name, label: "NAME", placeHolder: "User full name")
                    FieldSetText(textItem: $user.username, label: "USERNAME", placeHolder: "User nickname")
                    }
                    .padding(.vertical, 20)
                    .listRowInsets(EdgeInsets())
                }

                RoundedButton().padding(.vertical, 20)
            }
            // .offset(y: kGuardian.slide).animation(.basic(duration: 1.0))
            .navigationBarTitle(Text("New User"))
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
    struct UsersEdit_Previews: PreviewProvider {
        static var previews: some View {
            return UserCreate(isEditing: .constant(true))
                .environmentObject(sampleStore)
                .previewLayout(.fixed(width: 375, height: 1000))
        }
    }
#endif
