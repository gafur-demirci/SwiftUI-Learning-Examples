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
        Form {
            List {
                // MARK: - HEADER
                Text("What to Watch")
                    .font(.largeTitle.weight(.black))
                    .foregroundStyle(.blue.gradient)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
                
                // MARK: - TITLE
                TextField("Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle.weight(.light))
                
                // MARK: - GENRE
                Picker("Genre", selection: $selectedGenre) {
                    ForEach(Genre.allCases) { genre in
                        Text(genre.name)
                            .tag(genre)
                    }
                }
                
                // MARK: - SAVE BUTTON
                Button(action: {
                    if title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return }
                    addNewMovie()
                    dismiss()
                }, label: {
                    Text("Save")
                        .font(.title2.weight(.medium))
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.roundedRectangle)
                .disabled(title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                
                // MARK: - CANCEL BUTTON
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Close")
                        .frame(maxWidth: .infinity)
                })
                
            } //: LIST
            .listRowSeparator(.hidden)
        } //: FORM
    }
    
    // MARK: - FUNCTIONS
    
    private func addNewMovie() {
        let newMovie = Movie(title: title, genre: selectedGenre)
        modelContext.insert(newMovie)
        title = ""
        selectedGenre = .kids
    }
}

#Preview {
    NewMovieFormView()
}
