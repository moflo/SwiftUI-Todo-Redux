//
//  UsersRow.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct UsersRow: View {
    @EnvironmentObject var store: AppStore
    let user: User

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(user.name).font(.title)
                Text(user.nickname)
                    .color(.secondary)
            }.padding(.leading, 8)
        }.padding(8)
    }
}

#if DEBUG
    struct UsersList_Previews: PreviewProvider {
        static var previews: some View {
            UsersRow(user: sampleStore.usersState.users[0]).environmentObject(sampleStore)
        }
    }
#endif
