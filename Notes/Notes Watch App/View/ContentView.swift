//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Abdulgafur Demirci on 2.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @State private var notes: [Note] = []
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text: $text)
                
                Button(action: {
//                    addNote()
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(.plain)
                .foregroundStyle(.accent)
            } //: HSTACK
            .navigationTitle(Text("Notes"))
            Spacer()
        } //: VSTACK
    }
}

#Preview {
    ContentView()
}
