//
//  ContentView.swift
//  Watchlist
//
//  Created by Abdulgafur Demirci on 12.04.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.modelContext) var modelContext
    @Query var movies: [Movie]
    
    @State private var isSheetPresented: Bool = false
    @State private var randomMovie: String = ""
    @State private var isShowingAlert: Bool = false
    
    var body: some View {
        List {
            if !movies.isEmpty {
                Section(content: {
                    ForEach(movies) { movie in
                        HStack {
                            Text(movie.title)
                                .font(.title.weight(.light))
                                .padding(.vertical, 2)
                            
                            Spacer()
                            
                            Text(movie.genre.name)
                                .font(.footnote.weight(.medium))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 3)
                                .background(
                                    Capsule()
                                        .stroke(lineWidth: 1)
                                )
                                .foregroundStyle(.tertiary)
                            
                        } //: LIST ROW
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive, action: {
                                withAnimation {
                                    modelContext.delete(movie)
                                }
                            }, label: {
                                Label("Delete", systemImage: "trash")
                            })
                        }
                    }
                }, header: {
                    VStack {
                        
                        Text("Wathclist")
                            .font(.largeTitle.weight(.black))
                            .foregroundStyle(.blue.gradient)
                            .padding()
                        
                        HStack {
                            Label("Title", systemImage: "movieclapper")
                            Spacer()
                            Label("Genre", systemImage: "tag")
                        }
                    }
                })
            }
        } //: LIST
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
        // MARK: - SAFE AREA
        .safeAreaInset(edge: .bottom, alignment: .center) {
            HStack {
                if movies.count >= 2 {
                    // RANDOMIZE BUTTON
                    Button(action: {
                        randomMovieGenerator()
                        isShowingAlert = true
                    }, label: {
                        ButtonImageView(symbolName: "arrow.trianglehead.2.clockwise.rotate.90.circle.fill")
                    })
                    .alert(randomMovie, isPresented: $isShowingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                    .accessibilityLabel("Random Movie")
                    .sensoryFeedback(.success, trigger: isShowingAlert)
                    
                    Spacer()
                }
                // NEW MOVIE BUTTON
                Button(action: {
                    isSheetPresented.toggle()
                }, label: {
                    ButtonImageView(symbolName: "plus.circle.fill")
                })
                .accessibilityLabel("New Movie")
                .sensoryFeedback(.success, trigger: isSheetPresented)
            } //: HSTACK
            .padding(.horizontal)
        } //: SAFE AREA
        // MARK: SHEET
        .sheet(isPresented: $isSheetPresented, content: {
            NewMovieFormView()
        }) //: SHEET
    }
    
    // MARK: FUNCTIONS
    
    private func randomMovieGenerator() {
        randomMovie = movies.randomElement()!.title
    }
}

#Preview("Sample Data") {
    ContentView()
        .modelContainer(Movie.preview)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}
