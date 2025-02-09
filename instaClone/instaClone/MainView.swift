//
//  MainView.swift
//  instaClone
//
//  Created by Abdulgafur Demirci on 9.02.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                TabView {
                    Tab {
                        FeedsView()
                    } label: {
                        Image(systemName: "house.fill")
                        Text("Feed")
                    }
                    Tab {
                        UploadView()
                    } label: {
                        Image(systemName: "square.and.arrow.up.fill")
                        Text("Upload")
                    }
                    Tab {
                        SettingsView()
                    } label: {
                        Image(systemName: "person.fill")
                        Text("Settings")
                    }
                }
            }
        }
        .padding()
        .toolbarVisibility(.hidden)
    }
}

#Preview {
    MainView()
}
