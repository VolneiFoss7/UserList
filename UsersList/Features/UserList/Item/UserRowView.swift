//
//  UserRowVIew.swift
//  UsersList
//
//  Created by Volnei Foss on 26/02/26.
//

import SwiftUI

struct UserRowView: View {
    
    let viewModel: UserRowViewModel
    let onSelected: () -> Void
    
    var body: some View {
        VStack(alignment: .leading){
            Text(viewModel.user.name)
                .font(.system(size: 16, weight: .bold))
            Text(viewModel.user.email)
                .font(.system(size: 16, weight: .regular))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onTapGesture {
            onSelected()
        }
    }
}

#Preview {
    UserRowView(
        viewModel:
            UserRowViewModel(user:
                                User(id: 1,
                                     name: "Leanne Graham",
                                     email: "Sincere@april.biz",
                                     phone: "1-770-736-8031 x56442",
                                     company:
                                        Company(name: "Romaguera-Crona",
                                                catchPhrase: "Multi-layered client-server neural-net",
                                                bs: "harness real-time e-markets"))), onSelected: {})
}
