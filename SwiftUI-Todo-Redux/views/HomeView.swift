//
//  HomeView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Combine
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: AppState
    @State var selectedTab = Tab.tasks

    enum Tab: Int {
        case tasks, users
    }

    var body: some View {
        TabbedView(selection: $selectedTab) {
            TasksList().tabItemLabel(Text("Tasks")).tag(Tab.tasks)
            UsersList().tabItemLabel(Text("Team")).tag(Tab.users)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView().environmentObject(sampleStore)
//            HomeView()
        }
    }
#endif
