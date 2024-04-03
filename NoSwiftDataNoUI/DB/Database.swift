//
//  Database.swift
//  NoSwiftDataNoUI
//
//  Created by Jacob Bartlett on 02/04/2024.
//

import Foundation
import SwiftData

protocol Database<T> {
    associatedtype T = SwiftData.PersistentModel
    var container: ModelContainer { get }
    @MainActor func create(item: T) throws
    @MainActor func readItems(sortBy sortDescriptors: SortDescriptor<T>...) async throws -> [T]
    @MainActor func update(item: T) throws
    @MainActor func delete(item: T) throws
}

extension Database {
    
    @MainActor
    func create(item: T) throws {
        let context = container.mainContext
        context.insert(item)
        try context.save()
    }
    
    @MainActor
    func readItems(sortBy sortDescriptors: SortDescriptor<T>...) throws -> [T] {
        let context = container.mainContext
        let fetchDescriptor = FetchDescriptor<T>(
            sortBy: sortDescriptors
        )
        return try context.fetch(fetchDescriptor)
    }
    
    @MainActor
    func update(item: T) throws {
        let context = container.mainContext
        context.insert(item)
        try context.save()
    }
    
    @MainActor
    func delete(item: T) throws {
        let context = container.mainContext
        context.delete(item)
        try context.save()
    }
}
