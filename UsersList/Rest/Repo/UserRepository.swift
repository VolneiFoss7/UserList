//
//  UserRepository.swift
//  UsersList
//
//  Created by Volnei Foss on 27/02/26.
//

final class UserRepository {
    
    private let service: UserService
    
    init(service: UserService = UserService()) {
        self.service = service
    }
    
    func getUsers() async throws -> [User] {
        return try await service.fetchUsers()
    }
}
