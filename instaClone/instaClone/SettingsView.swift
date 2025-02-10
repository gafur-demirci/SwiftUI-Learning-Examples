//
//  SettingsView.swift
//  instaClone
//
//  Created by Abdulgafur Demirci on 9.02.2025.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Text("Settings")
                .padding()
            NavigationLink(destination: ContentView()) {
                Text("Çıkış Yap")
            }
        }
        .toolbarVisibility(.hidden)
    }
}

#Preview {
    SettingsView()
}
