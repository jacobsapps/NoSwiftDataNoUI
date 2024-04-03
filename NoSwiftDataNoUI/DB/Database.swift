//
//  Database.swift
//  NoSwiftDataNoUI
//
//  Created by Jacob Bartlett on 02/04/2024.
//

import Foundation

protocol Database<T> {
    associatedtype T
    func create(_ item: T) throws
    func create(_ items: [T]) throws
    func read(sortBy sortDescriptors: SortDescriptor<T>...) async throws -> [T]
    func update(_ item: T) throws
    func delete(_ item: T) throws
}
