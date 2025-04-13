//
//  NewMovieFormView.swift
//  Watchlist
//
//  Created by Abdulgafur Demirci on 13.04.2025.
//

import SwiftUI

struct NewMovieFormView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var selectedGenre: Genre = .kids
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NewMovieFormView()
}
