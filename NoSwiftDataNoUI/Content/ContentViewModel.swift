//
//  ContentViewModel.swift
//  NoSwiftDataNoUI
//
//  Created by Jacob Bartlett on 02/04/2024.
//

import Foundation

@Observable @MainActor
final class ContentViewModel: Sendable {
    
    enum ContentError: Error {
        case failedToInitializeDB
    }
    
    var users: [User] = []
    private let database: UserDatabase
    
    init() throws {
        do {
            self.database = try UserDatabase()
            fetchUsers()
        } catch {
            throw ContentError.failedToInitializeDB
        }
    }
    
    private func fetchUsers() {
        do {
            users = try database.readItems(sortBy: SortDescriptor<User>(\.surname), SortDescriptor<User>(\.firstName))
//            guard var user = users.first else { return }
//            print(user.age, user.id, user.firstName, user.surname)
//            //Optional(28) Optional(8C7952A8-D745-432A-ABCD-CEDF78E3FC07) Optional("Gilbertina") Optional("AARON")
//            user.firstName = "Annabelle"
//            try database.update(item: user)
//            try database.delete(item: user)
//            try database.create(item: User(firstName: "Annabelle", surname: "AARON", age: 23))
            
        } catch {
            print(error)
        }
    }
}
