//
//  ContentView.swift
//  Paws
//
//  Created by Abdulgafur Demirci on 12.04.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var pets: [Pet]
    
    @State private var path = [Pet]()
    @State private var isEditing: Bool = false
    
    let layout = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120))
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: layout, content: {
                    GridRow {
                        ForEach(pets) { pet in
                            NavigationLink(value: pet) {
                                VStack {
                                    
                                    if let imageData = pet.photo {
                                        if let image = UIImage(data: imageData) {
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFit()
                                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                                        }
                                    } else {
                                        Image(systemName: "pawprint.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(40)
                                            .foregroundStyle(.quaternary)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(pet.name)
                                        .font(.title.weight(.light))
                                        .padding(.vertical)
                                    
                                    Spacer()
                                } //: VSTACK
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                                .overlay(alignment: .topTrailing) {
                                    if isEditing {
                                        Menu(content: {
                                            Button("Delete", systemImage: "trash", role: .destructive) {
                                                withAnimation {
                                                    modelContext.delete(pet)
                                                    try? modelContext.save()
                                                }
                                            }
                                        }, label: {
                                            Image(systemName: "trash.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 36, height: 36)
                                                .foregroundStyle(.red)
                                                .symbolRenderingMode(.multicolor)
                                                .padding()
                                        })
                                    }
                                }
                            } //: NAVLINK
                            .foregroundStyle(.primary)
                        } //: LOOP
                    } // GRID ROW
                }) //: GRID LAYOUT
                .padding(.horizontal)
            } //: SCROLLVIEW
            .navigationTitle(pets.isEmpty ? "" : "Paws")
            .navigationDestination(for: Pet.self, destination: EditPetView.init)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        withAnimation {
                            isEditing.toggle()
                        }
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        addPet()
                    }) {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .overlay {
                if pets.isEmpty {
                    CustomContentIUnavailableView(
                        title: "No Pets",
                        icon: "dog.circle",
                        description: "Add a new pet to get started."
                    )
                }
            }
        } //: NAVSTACK
    }
    
    func addPet() {
        isEditing = false 
        let pet = Pet(name: "Best Friend")
        modelContext.insert(pet)
        path = [pet]
    }
}

#Preview("Sample Data") {
    ContentView()
        .modelContainer(Pet.preivew)
}

#Preview("No Data") {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}
