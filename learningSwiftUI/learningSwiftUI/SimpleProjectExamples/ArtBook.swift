//
//  ArtBook.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.01.2025.
//

import SwiftUI
import CoreData

struct ArtBook: View {
    
    @State private var selectedArt = Set<Paints.ID>()
    @State private var artArray: [Paints] = []
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Paints.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Paints.name, ascending: true)]
    )
    var paints: FetchedResults<Paints>
    
    var body: some View {
        NavigationStack {
            VStack {
                Table(paints, selection: $selectedArt, columns: {
                    TableColumn("Name") { art in
                        NavigationLink(destination: ArtDetail(art: art)) {
                            VStack(alignment: .leading) {
                                Text(art.name!)
                                    .font(.headline)
                                    .foregroundStyle(.black)
                                    .padding(.bottom, 5)
                                Text(art.artist!)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                })
//                if let selectedPaint = selectedArt {
//                    print(selectedPaint)
//                }
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
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.getArts()
            })
//            getArts()
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
}
