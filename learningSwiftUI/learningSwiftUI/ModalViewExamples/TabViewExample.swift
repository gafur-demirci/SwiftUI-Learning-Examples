//
//  TabViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 2.09.2024.
//

import SwiftUI

struct TabViewExample: View {
    
    @Environment(ApplicationData.self) private var appData
    
    var body: some View {
        TabView {
            BookView(
                book: appData.userData[0]
            )
            .tabItem {
                Label(
                    "Favorite Book",
                    systemImage: "book.circle"
                )
            }
            ModalViewExample()
                .tabItem {
                    Label(
                        "All Books",
                        systemImage: "gear"
                    )
                }
                .badge(12)
        }
    }
}

#Preview {
    TabViewExample()
        .environment(ApplicationData())
}
