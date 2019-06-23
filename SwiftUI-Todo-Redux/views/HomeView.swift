//
//  HomeView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("SwiftUI Todo App With Redux State")
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
#endif
