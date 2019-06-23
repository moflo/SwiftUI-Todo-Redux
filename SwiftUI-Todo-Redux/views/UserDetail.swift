//
//  UserDetail.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct UserDetail: View {
    @EnvironmentObject var store: AppStore
    let user: User

    var body: some View {
        VStack {
            Text(user.name).font(.title)
            HStack(alignment: .leading, spacing: 8) {
                Text(user.nickname).font(.title)
                Text(user.id)
                    .color(.secondary)
            }.padding(.leading, 8)
        }.padding(8)
    }
}

#if DEBUG
    struct UsersList_Previews: PreviewProvider {
        static var previews: some View {
            UserDetail(user: sampleStore.usersState.users[0]).environmentObject(sampleStore)
        }
    }
#endif
