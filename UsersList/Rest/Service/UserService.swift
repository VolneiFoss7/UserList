//
//  UserService.swift
//  UsersList
//
//  Created by Volnei Foss on 27/02/26.
//

final class UserService {
    
    private let network: NetworkingHelper
    
    init(network: NetworkingHelper = .shared) {
        self.network = network
    }
    
    func fetchUsers() async throws -> [User] {
        return try await network.doGet(
            urlString: "https://jsonplaceholder.typicode.com/users"
        )
    }
}
