//
//  ArtBook.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.01.2025.
//

import SwiftUI

struct ArtBook: View {
    
    @Environment(SimpsonData.self) private var simpsonData: SimpsonData
    @State private var selectedSimpson = Set<Simpson.ID>()
    
    var body: some View {
        NavigationView {
            Table(simpsonData.simpsons, selection: $selectedSimpson) {
                TableColumn("Name") { simpson in
                    NavigationLink(destination: TheSimpson(simpson: simpson)) {
                        Text(simpson.name)
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding(.bottom, 5)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Simpsons")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(value: "Settings View", label: {
                        Image(systemName: "gear")
                    })
                }
            }
            .navigationDestination(for: String.self, destination: { viewId in
                if viewId == "Settings View" {
                    SettingsView()
                }
            })
        }
    }
}

#Preview {
    ArtBook()
        .environment(SimpsonData())
}
