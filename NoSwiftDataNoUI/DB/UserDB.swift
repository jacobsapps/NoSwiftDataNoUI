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
    
    // Set the configuration to use an in-memory DB when unit testing
    init() throws {
        container = try ModelContainer(for: User.self)
    }
}
