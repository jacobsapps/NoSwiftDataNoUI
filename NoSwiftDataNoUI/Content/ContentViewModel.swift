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
        fetchUsers()
    }
    
    private func fetchUsers() {
        do {
            users = try userDB.read(sortBy:
                                        SortDescriptor<User>(\.surname),
                                        SortDescriptor<User>(\.firstName)
            )
            
        } catch {
            print(error)
        }
    }
    
    private func generateUsers() {
        let users = (0..<10_000).compactMap { _ in try? User() }
        try? userDB.create(users)
    }
}
