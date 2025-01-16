//
//  ArtBook.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.01.2025.
//

import SwiftUI
import CoreData

struct ArtBook: View {
    
    @Environment(ArtData.self) private var artData: ArtData
    @State private var selectedArt = Set<Paints.ID>()
    @State private var artArray: [Paints] = []
    
    var body: some View {
        NavigationStack {
            Table(artArray, selection: $selectedArt) {
                TableColumn("Name") { art in
                    NavigationLink(destination: ArtDetail(art: art)) {
                        Text(art.name)
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding(.bottom, 5)
                    }
                }
            }
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
        .onAppear() {
            getArts()
        }
    }
    
    func getArts() {
        let appDelegate = ArtAppDelegate()
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paints")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                print(result.value(forKey: "name") as! String)
                artArray.append(result as! Paints)
            }
        } catch {
            print("Error while fetching")
        }
    }
}

#Preview {
    ArtBook()
        .environment(ArtData())
}
