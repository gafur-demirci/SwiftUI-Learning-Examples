//
//  SettingsView.swift
//  instaClone
//
//  Created by Abdulgafur Demirci on 9.02.2025.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    
    @State private var isSignedOut: Bool = false
    
    var body: some View {
        NavigationStack {
            Text("Settings")
                .padding()
            Button(action: {
                do {
                    try Auth.auth().signOut()
                    isSignedOut = true
                } catch {
                    print("Error while signing out: \(error.localizedDescription)")
                }
            }, label: {
                Text("Çıkış Yap")
            })
            .navigationDestination(isPresented: $isSignedOut) {
                ContentView()
            }
        }
        .toolbarVisibility(.hidden)
    }
}

#Preview {
    SettingsView()
}
