//
//  TabViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 2.09.2024.
//

import SwiftUI

struct TabViewExample: View {
    
    @Environment(ApplicationData.self) private var appData
    @State private var selectedView: Int = 1
    
    var body: some View {
        TabView {
            ForEach(appData.userData) { book in
                Image(book.cover)
                .resizable()
                .scaledToFit()
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        /*
        TabView(selection: $selectedView) {
            MultipleViewsExample()
            .tabItem {
                Label(
                    "Books",
                    systemImage: "book.circle"
                )
            }
            .tag(0)
            SettingsView()
                .tabItem {
                    Label(
                        "Settings",
                        systemImage: "gear"
                    )
                }
                .badge(12)
                .tag(1)
        }
        */
    }
}

#Preview {
    TabViewExample()
        .environment(ApplicationData())
}
