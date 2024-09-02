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
        TabView(selection: $selectedView) {
            BookView(
                book: appData.userData[0]
            )
            .tabItem {
                Label(
                    "Favorite Book",
                    systemImage: "book.circle"
                )
            }
            .tag(0)
            ModalViewExample()
                .tabItem {
                    Label(
                        "All Books",
                        systemImage: "gear"
                    )
                }
                .badge(12)
                .tag(1)
        }
    }
}

#Preview {
    TabViewExample()
        .environment(ApplicationData())
}
