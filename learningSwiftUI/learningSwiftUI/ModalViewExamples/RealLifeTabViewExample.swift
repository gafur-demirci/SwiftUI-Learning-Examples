//
//  RealLifeTabViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 29.12.2024.
//

import SwiftUI

@available(iOS 18.0, *)
struct RealLifeTabViewExample: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "book.circle") {
                ListOfBooksView()
            }
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
            Tab(role: .search) {
                SearchView()
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    if #available(iOS 18.0, *) {
        RealLifeTabViewExample()
            .environment(ApplicationMyData.shared)
    }
}
