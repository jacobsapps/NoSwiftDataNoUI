//
//  ContentViewModel.swift
//  NoSwiftDataNoUI
//
//  Created by Jacob Bartlett on 02/04/2024.
//

import Foundation

@Observable
final class ContentViewModel {
    
    enum ContentError: Error {
        case failedToInitializeDB
    }
    
    var users: [User] = []
    private let database: UserDB
    
    init() throws {
        do {
            self.database = try UserDB()
            fetchUsers()
            
        } catch {
            throw ContentError.failedToInitializeDB
        }
    }
    
    private func fetchUsers() {
        do {
            users = try database.read(sortBy: 
                                        SortDescriptor<User>(\.surname),
                                        SortDescriptor<User>(\.firstName)
            )
            
        } catch {
            print(error)
        }
    }
    
    private func generateUsers() {
        let users = (0..<10_000).compactMap { _ in try? User() }
        try? database.create(users)
    }
}
