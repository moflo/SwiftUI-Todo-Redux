# SwiftUI-Todo-Redux
SwiftUI Todo Redux app example using a React/Redux monolithic state store with flux like dispatch/reduce actions

## Background

SwiftUI based app using a centralized, 'monolithic' AppState() which binds to the UI using the `Combine` framework and a `PassthroughSubject` method. This architecture is based on the React/Redux pattern and has a few key benefits:

1. Global app state is maintained in single global struct, `let state = AppState()`
2. Testing and Previewing of individual views can then be isolated with local test states, eg., a local debug call to `environmentObject(sampleStore)` can be used for UI Previews anywhere in the app
3. Isolating `Actions` from `State` allows for cleaner synchronous behavior, eg., handle both server based calls and local UI-only actions in the same method or flow
4. Chnages to state are `Reduced` within a simple state machine method which can be easily tested


## File Structure

The structure of the app follows a simple pattern of MVS: Models, Views and State. Models contain all the relevant state, separated into relevant gropus such as Tasks, Users, Authorization, etc. The `models` directory contains model definitions, as well as codecs and backing store (ie., API Services) for isolated testing of the models and their propoer storage. The `states` directory contains a combination of global app state, the sub-states or `flux` describiing the relevant groups (eg., Task, User), actions which the user initiates (eg., `TaskActions` or `UserActions`) and then trigger asynchronous server-based or synchronous actions. The result of the actions are then reduced (eg., `TaskStateReducer` or `UserStateReducer`) to subsequently modify the global app state.

The `AppState` structure holds referenes to the group states (ie., Tasks and User lists), as well as acts as a central `dispatch` point for both actions and handling any state updates via the `Combine` framework. 

Finally, all UI Views are maintained within their respective hierarchy, with a Home or Root view driving all app navigation.


```
.
|____AppDelegate.swift
|____SceneDelegate.swift
|____views
| |____HomeView.swift
|____models
| |____User.swift
| |____UserResponse.swift
| |____Task.swift
|____states
| |____AppState.swift
| |____flux (substate)
| | |____UsersState.swift
| | |____FluxState.swift
| | |____TasksState.swift
| |____actions
| | |____TaskActions.swift
| | |____Action.swift
| | |____UserActions.swift
| |____reducers (statemachine)
| | |____Reducer.swift
| | |____UserStateReducer.swift
| | |____TaskStateReducer.swift
```


