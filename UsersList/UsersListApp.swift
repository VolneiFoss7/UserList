//
//  UsersListApp.swift
//  UsersList
//
//  Created by Volnei Foss on 26/02/26.
//

import SwiftUI

@main
struct UsersListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                UserListView(viewModel: UserListViewModel(users: []))
            }
        }
    }
}

