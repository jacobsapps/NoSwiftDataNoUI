//
//  UserDatabase.swift
//  NoSwiftDataNoUI
//
//  Created by Jacob Bartlett on 02/04/2024.
//

import Foundation
import SwiftData

final class UserDatabase: Database {
    
    typealias T = User
    
    let container: ModelContainer
    
    init() throws {
        container = try ModelContainer(for: User.self)
    }
    
    @MainActor
    func create(item: User) throws {
        let context = container.mainContext
        context.insert(item)
        try context.save()
    }
    
    @MainActor
    func readItems(sortBy sortDescriptors: SortDescriptor<User>...) throws -> [User] {
        let context = container.mainContext
        let fetchDescriptor = FetchDescriptor<User>(
            sortBy: sortDescriptors
        )
        return try context.fetch(fetchDescriptor)
    }
    
    @MainActor
    func update(item: User) throws {
        let context = container.mainContext
        context.insert(item)
        try context.save()
    }
    
    @MainActor
    func delete(item: User) throws {
        let context = container.mainContext
        context.delete(item)
        try context.save()
    }
}
