//
//  SwiftDatabase.swift
//  NoSwiftDataNoUI
//
//  Created by Jacob Bartlett on 03/04/2024.
//

import Foundation
import SwiftData

protocol SwiftDatabase<T>: Database {
    associatedtype T = PersistentModel
    var container: ModelContainer { get }
}

extension SwiftDatabase {
    
    func create<T: PersistentModel>(_ items: [T]) throws {
        let context = ModelContext(container)
        for item in items {
            context.insert(item)
        }
        try context.save()
    }
    
    func create<T: PersistentModel>(_ item: T) throws {
        let context = ModelContext(container)
        context.insert(item)
        try context.save()
    }
    
    func read<T: PersistentModel>(sortBy sortDescriptors: SortDescriptor<T>...) throws -> [T] {
        let context = ModelContext(container)
        let fetchDescriptor = FetchDescriptor<T>(
            sortBy: sortDescriptors
        )
        return try context.fetch(fetchDescriptor)
    }
    
    func update<T: PersistentModel>(_ item: T) throws {
        let context = ModelContext(container)
        context.insert(item)
        try context.save()
    }
    
    func delete<T: PersistentModel>(_ item: T) throws {
        let context = ModelContext(container)
        let idToDelete = item.persistentModelID
        try context.delete(model: T.self, where: #Predicate { item in
            item.persistentModelID == idToDelete
        })
        try context.save()
    }
}
