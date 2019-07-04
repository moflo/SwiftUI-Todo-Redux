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
        ZStack(alignment: .bottom) {
        TabbedView(selection: self.$selectedTab) {
            TasksList().tabItem{ VStack { Image("tab_task"); Text("Tasks") } }.tag(Tab.tasks)
            UsersList().tabItem{ VStack { Image("tab_user"); Text("Team") } }.tag(Tab.users)
            }
            .edgesIgnoringSafeArea(.top)

            NotificationBadge(text: "Message goes here", color: .blue, show: $store.tasksState.hasTaskError)
                .environmentObject(store)
                .padding(.vertical, 66)
        }
    }
}

#if DEBUG
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            let sampleStore2 = AppState(
                usersState: UsersState(users: testUsersModels),
                tasksState: TasksState(tasks: testTasksModels)
            )

            sampleStore2.tasksState.hasTaskError = true
            sampleStore2.tasksState.taskErrorMessage = "Hello Message"

            return Group {
                HomeView().environmentObject(sampleStore)

                HomeView().environmentObject(sampleStore2)
            }
        }
    }
#endif
