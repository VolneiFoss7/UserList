//
//  UserListView.swift
//  UsersList
//
//  Created by Volnei Foss on 27/02/26.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: UserListViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            header
            listView
        }
        .onAppear {
            Task {
                await viewModel.fetchUsers()
            }
        }
        .navigationDestination(item: $viewModel.selectedUser) { user in
            UserDetail(viewModel: UserDetailViewModel(user: user))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal, 16)
        .padding(.top, 32)
    }
    
    private var header: some View {
        VStack(spacing: 4){
            Text("Users List")
                .font(.system(size: 32, weight: .bold))
            
            Rectangle()
                .frame(width: 150, height: 8)
        }
    }
    
    private var listView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Group {
                if viewModel.viewState == .loading {
                    listLoading
                } else {
                    list
                }
            }
        }
    }
    
    private var list: some View {
        ForEach(self.viewModel.users, id: \.id) { user in
            UserRowView(
                viewModel: .init(user: user),
                onSelected: {
                    viewModel.selectedUser = user
                }
            )
            .padding(.vertical, 8)
        }
    }
    
    private var listLoading: some View {
        VStack(spacing: 0) {
            ForEach(0..<15) { _ in
                VStack {
                    ShimmerView(width: 150, height: 16)
                    ShimmerView(width: 150, height: 16)
                }
                .padding(.vertical, 8)
            }
        }
    }
}

#Preview {
    NavigationStack {
        UserListView(viewModel: UserListViewModel(users: []))
    }
}

