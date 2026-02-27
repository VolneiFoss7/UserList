//
//  UserDetailViewModel.swift
//  UsersList
//
//  Created by Volnei Foss on 27/02/26.
//

import Foundation

class UserDetailViewModel {
    let user: User
    
    var name : String {
        "name: \(user.name)"
    }
    
    var email : String {
        "email: \(user.email)"
    }
    
    var phone : String {
        "phone: \(user.phone)"
    }
    
    var company: String {
        "company: \(user.company.name) \ncatchPhrase: \(user.company.catchPhrase) \nbs: \(user.company.bs)"
    }
    
    init(user: User) {
        self.user = user
    }
}
