//
//  UserListVIewModel.swift
//  UsersList
//
//  Created by Volnei Foss on 27/02/26.
//

import SwiftUI
import Combine

class UserListViewModel: ObservableObject {
    
    enum ViewState {
        case loading
        case idle
        case error
    }
    
    private let repo: UserRepository
        
    @Published var viewState: ViewState = .loading
    @Published var users: [User] = []
    @Published var selectedUser: User?
    
    init(users: [User], repo: UserRepository = UserRepository()) {
        self.users = users
        self.repo = repo
    }
    
    @MainActor
    func fetchUsers() async {
        self.viewState = .loading
        do {
            try await Task.sleep(nanoseconds: 4_000_000_000)
            
            let users = try await repo.getUsers()
            self.users = users
            self.viewState = .idle
        } catch {
            self.viewState = .error
        }
    }
}
