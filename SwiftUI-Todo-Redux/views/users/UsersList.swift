//
//  UsersList.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct UsersList: View {
    @EnvironmentObject var store: AppState
    @State var showEdit = false

    func loadPage() {
        print("loadPage")
        store.dispatch(action: UserActions.getUsers())
    }

    var userSection: some View {
        Section {
            ForEach(store.usersState.users) { user in
                NavigationLink(destination: UserDetail(user: user)) {
                    UsersRow(user: user)
                }
            }
        }
    }

    var taskCreateModal: Modal {
        return Modal(UserCreate(isEditing: $showEdit).environmentObject(store))
    }

    var body: some View {
        NavigationView {
            List {
                userSection

                NavigationLink(
                    destination: UserCreate(isEditing: $showEdit),
                    label: { Text("Add") }
                )
            }
            .navigationBarTitle(Text("My Tasks"))
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                HStack {
                                    Button(action: { self.showEdit.toggle() }, label: { Text("Add") })
            })
            .presentation(self.showEdit ? self.taskCreateModal : nil)
            .onAppear {
                self.loadPage()
            }
        }
    }
}

#if DEBUG
    struct UsersList_Previews: PreviewProvider {
        static var previews: some View {
            UsersList().environmentObject(sampleStore)
        }
    }
#endif
