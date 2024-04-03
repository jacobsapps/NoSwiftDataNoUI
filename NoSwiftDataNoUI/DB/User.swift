//
//  User.swift
//  NoSwiftDataNoUI
//
//  Created by Jacob Bartlett on 02/04/2024.
//

import Foundation
import SwiftData

@Model
final class User {
    
    enum UserError: Error {
        case nameNotFound
    }
    
    @Attribute(.unique) let id: UUID
    let firstName: String
    let surname: String
    let age: Int
    
    init() throws {
        guard let firstName = firstNames.randomElement(),
              let surname = surnames.randomElement() else {
            throw UserError.nameNotFound
        }
        self.id = UUID()
        self.firstName = firstName
        self.surname = surname
        self.age = Int.random(in: 0..<99)
    }
    
    init(firstName: String, surname: String, age: Int) {
        self.id = UUID()
        self.firstName = firstName
        self.surname = surname
        self.age = age
    }
}
