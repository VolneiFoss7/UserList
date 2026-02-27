//
//  User.swift
//  UsersList
//
//  Created by Volnei Foss on 26/02/26.
//

struct User: Decodable, Identifiable, Hashable {
    let id: Int
    let name : String
    let email: String
    let phone: String
    let company: Company
}

struct Company: Decodable, Hashable {
    let name: String
    let catchPhrase: String
    let bs: String
}

