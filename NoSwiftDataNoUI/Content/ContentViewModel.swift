//
//  ContentViewModel.swift
//  NoSwiftDataNoUI
//
//  Created by Jacob Bartlett on 02/04/2024.
//

import Foundation

@Observable
final class ContentViewModel {
    
    var users: [User] = []
    private let userDB: UserDB
    
    init() {
        userDB = try! UserDB()
        
        do {
            try fetchUsers()
            
        } catch {
            print(error)
        }
    }
    
    private func fetchUsers() throws {
        users = try userDB.read(sortBy:
                                    SortDescriptor<User>(\.surname),
                                SortDescriptor<User>(\.firstName)
        )
        
        if users.isEmpty {
            try generateUsers()
            try fetchUsers()
        }
    }
    
    private func generateUsers() throws {
        let users = (0..<10_000).compactMap { _ in try? User() }
        try userDB.create(users)
    }
}
