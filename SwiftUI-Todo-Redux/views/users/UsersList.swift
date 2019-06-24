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

    var userSection: some View {
        Section {
            ForEach(store.usersState.users) { user in
                NavigationButton(destination: UserDetail(user: user)) {
                    UsersRow(user: user)
                }
            }
        }
    }

    var body: some View {
        NavigationView {
            List {
                userSection
            }
            .navigationBarTitle(Text("My Users"))
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
