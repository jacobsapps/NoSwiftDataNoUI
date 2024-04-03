//
//  UserDB.swift
//  NoSwiftDataNoUI
//
//  Created by Jacob Bartlett on 02/04/2024.
//

import Foundation
import SwiftData

final class UserDB: Database {
    
    typealias T = User
    
    let container: ModelContainer
    
    init() throws {
        container = try ModelContainer(for: User.self)
    }
}
