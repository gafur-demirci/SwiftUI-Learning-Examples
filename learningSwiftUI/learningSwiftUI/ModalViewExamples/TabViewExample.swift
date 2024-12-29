//
//  TabViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 2.09.2024.
//

import SwiftUI

@available(iOS 18.0, *)
struct TabViewExample: View {
    
    @Environment(ApplicationMyData.self) private var appData
    @State private var selectedView: Int = 1
    
    var body: some View {
        TabView {
            Tab(content: {
                Text("Main Screen")
                    
            }, label: {
                Text("Home")
                Image(systemName: "book.circle")
            })
            Tab(content: {
                Text("Settings")
            }, label: {
                Text("Settings")
                Image(systemName: "gear")
            })
            TabSection("More Info") {
                Tab("Additional One", systemImage: "plus") {
                    Text("Additional Tab One")
                }
                Tab("Additional Two", systemImage: "pencil") {
                    Text("Additional Tab Two")
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewSidebarHeader {
            Text("Menu")
                .padding()
        }
//        .indexViewStyle(.page(backgroundDisplayMode: .always))
//        .ignoresSafeArea(.all)
        /*
        TabView {
            ForEach(appData.userData) { book in
                Image(book.cover)
                .resizable()
                .scaledToFit()
            }
        }
        #if os(iOS)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        #endif
        */
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
    if #available(iOS 18.0, *) {
        TabViewExample()
            .environment(ApplicationMyData())
    } else {
        // Fallback on earlier versions
    }
}
