//
//  UserDB.swift
//  NoSwiftDataNoUI
//
//  Created by Jacob Bartlett on 02/04/2024.
//

import Foundation
import SwiftData

final class UserDB: SwiftDatabase {
    
    typealias T = User
    
    let container: ModelContainer
    
    /// Use an in-memory store to store non-persistent data when unit testing
    ///
    init(useInMemoryStore: Bool = false) throws {
        let configuration = ModelConfiguration(for: User.self, isStoredInMemoryOnly: useInMemoryStore)
        container = try ModelContainer(for: User.self, configurations: configuration)
    }
}
