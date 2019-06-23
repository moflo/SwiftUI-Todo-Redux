//
//  Reducer.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Foundation

protocol Reducer {
    associatedtype StateType: FluxState
    func reduce(state: StateType, action: Action) -> StateType
}
