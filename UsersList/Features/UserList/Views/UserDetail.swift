//
//  UserDetail.swift
//  UsersList
//
//  Created by Volnei Foss on 27/02/26.
//

import SwiftUI

struct UserDetail: View {
    let viewModel: UserDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            Text("User detail")
                .font(.system(size: 22, weight: .bold))
            Rectangle()
                .frame(width: 70, height: 4)
                .padding(.bottom, 16)
            Text(viewModel.name)
            Text(viewModel.email)
            Text(viewModel.phone)
            Text(viewModel.company)
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        
    }
}

#Preview {
    UserDetail(viewModel:
                UserDetailViewModel(user: User(id: 1,
                                             name: "Leanne Graham",
                                             email: "Sincere@april.biz",
                                             phone: "1-770-736-8031 x56442",
                                             company:
                                                Company(name: "Romaguera-Crona",
                                                        catchPhrase: "Multi-layered client-server neural-net",
                                                        bs: "harness real-time e-markets"))
    ))
}
