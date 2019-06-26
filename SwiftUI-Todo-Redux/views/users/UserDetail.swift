//
//  UserDetail.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct UserDetail: View {
    // Based on "in-line" detail editing structure proposed by Apple
    /// https://developer.apple.com/tutorials/swiftui/working-with-ui-controls

    @EnvironmentObject var store: AppState

    @Environment(\.editMode) var mode
    @State var user: User
    /// Value of `draftUser` is set to `user` using the Form `.onAppear` call
    @State var draftUser: User = User(id: 0, name: "placeholder user", username: "@user1")

    var UserSummary: some View {
        VStack {
            Text("UserDetail")
            AnyView(
                Text(user.name).font(.title))
            AnyView(
                Text(user.username)
            )
        }
    }

    var UserEdit: some View {
        Form {
            Section(header: Text("User Information")) {
                VStack(alignment: .leading) {
                    FieldSetText(textItem: $draftUser.name, label: "NAME", placeHolder: "User full name")
                    FieldSetText(textItem: $draftUser.username, label: "USERNAME", placeHolder: "User nickname")
                }
                .padding(.vertical, 20)
                .listRowInsets(EdgeInsets())
            }

            RoundedButton().padding(.vertical, 20)
        }
        .onAppear(perform: { self.draftUser = self.user })
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if self.mode?.value == .active {
                    Button(action: {
                        self.mode?.animation().value = .inactive
                        // Update current userID
                        self.user = self.draftUser
                        // store.dispatch(aciton: UserActions.updateUser(id: user.id, user: draftUser))
                        self.store.dispatch(action: TaskActions.Notification(show: true, message: "Changes saved"))

                    }) {
                        Text("Save")
                    }
                }

                Spacer()

                EditButton()
            }
            if self.mode?.value == .inactive {
                UserSummary
            } else {
                UserEdit
            }
        }
        .padding()
    }
}

#if DEBUG
    struct UserDetail_Previews: PreviewProvider {
        static var previews: some View {
            UserDetail(user: testUsersModels[0]).environmentObject(sampleStore)
        }
    }
#endif
