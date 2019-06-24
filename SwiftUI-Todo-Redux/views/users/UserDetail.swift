//
//  UserDetail.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct UserDetail: View {
    @EnvironmentObject var store: AppState
    var user: User

    var body: some View {
        VStack {
            AnyView(Text("UserDetail"))
            AnyView(
                Text(user.name).font(.title))
            AnyView(
                Text(user.username)
            )
//            AnyView(
//                Text(user.id)
//            )
        }
    }
}

#if DEBUG
    struct UserDetail_Previews: PreviewProvider {
        static var previews: some View {
            UserDetail(user: testUsersModels[0]).environmentObject(sampleStore)
        }
    }
#endif
