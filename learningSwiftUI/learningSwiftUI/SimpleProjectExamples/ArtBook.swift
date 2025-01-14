//
//  ArtBook.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.01.2025.
//

import SwiftUI

struct ArtBook: View {
    
    var body: some View {
        NavigationStack {
//            Table() {
//
//            }
            VStack {
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("My Art Gallery")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(value: "Add Art", label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .navigationDestination(for: String.self, destination: { viewId in
                if viewId == "Add Art" {
                    AddArt()
                }
            })
        }
    }
}

#Preview {
    ArtBook()
}
