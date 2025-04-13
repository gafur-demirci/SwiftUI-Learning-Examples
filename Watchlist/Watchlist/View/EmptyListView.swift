//
//  EmptyListView.swift
//  Watchlist
//
//  Created by Abdulgafur Demirci on 13.04.2025.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        ContentUnavailableView {
            Circle()
                .fill(.blue.gradient)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 30)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 60)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 90)
                .frame(width: 180)
                .overlay(content: {
                    Image(systemName: "movieclapper")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundStyle(Color(UIColor.secondarySystemBackground))
                        .padding(.top, -6)
                })
                .padding(.bottom, 90)
        } description: {
            GroupBox {
                TabView {
                    PageTabView(
                        icon: "1.circle",
                        description: "Add some movies to your watchlist if you plan to watch later"
                    )
                    .padding(.bottom, 36)
                    PageTabView(
                        icon: "2.circle",
                        description: "Later on you can also choose a random film to watch"
                    )
                    .padding(.bottom, 36)
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(minWidth: 0, maxWidth: 560, minHeight: 120, maxHeight: 180)
            }
        }
    }
}

#Preview("Light Mode") {
    EmptyListView()
}

#Preview("Dark Mode") {
    EmptyListView()
        .preferredColorScheme(.dark)
}
