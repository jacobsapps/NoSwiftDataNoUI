//
//  ContentView.swift
//  NoSwiftDataNoUI
//
//  Created by Jacob Bartlett on 02/04/2024.
//

import SwiftUI

@MainActor
struct ContentView: View {
    
    @State private var viewModel: ContentViewModel = try! ContentViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users) {
                    UserCell(user: $0)
                }
            }
//            .padding()
            .navigationTitle("Users")
        }
    }
}

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            Text("\(user.firstName.localizedCapitalized) \(user.surname.capitalized)")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("^[\(user.age) year](inflect: true)")
                .font(.caption)
        }
    }
}