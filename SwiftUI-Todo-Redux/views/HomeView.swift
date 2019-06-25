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
        ZStack {
            TabbedView(selection: $selectedTab) {
                TasksList().tabItemLabel(VStack { Image("tab_task"); Text("Tasks") }).tag(Tab.tasks)
                UsersList().tabItemLabel(VStack { Image("tab_user"); Text("Team") }).tag(Tab.users)
            }
            .edgesIgnoringSafeArea(.top)

            NotificationBadge(text: "Message goes here", color: .blue, show: $store.tasksState.hasTaskError)
                .padding(.bottom, 10)
        }
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
