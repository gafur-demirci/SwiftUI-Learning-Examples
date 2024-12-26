//
//  MacDetailView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 25.12.2024.
//

import SwiftUI

struct MacDetailView: View {
    var body: some View {
        VStack {
            Text("Mac Detail View")
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: {
                    print("Adding Mac")
                }, label: {
                    Label("Add Mac", systemImage: "plus")
                })
            }
        }
        .navigationTitle("Mac Title")
        #if os(macOS)
        .navigationSubtitle("Mac Subtitle")
        #endif
    }
}

#Preview {
    MacDetailView()
}
