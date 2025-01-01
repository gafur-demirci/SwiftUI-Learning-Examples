//
//  TabSearchView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 29.12.2024.
//

import SwiftUI

@available(iOS 18.0, *)
struct TabSearchView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "book.circle") {
                Text("Main Screen")
            }
            Tab("Settings", systemImage: "gear") {
                Text("Settings")
            }
            Tab(role: .search) {
                Text("Search")
            }
        }
    }
}

#Preview {
    if #available(iOS 18.0, *) {
        TabSearchView()
    }
}
