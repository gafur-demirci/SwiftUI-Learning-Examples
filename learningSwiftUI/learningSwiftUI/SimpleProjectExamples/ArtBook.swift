//
//  ArtBook.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.01.2025.
//

import SwiftUI
import CoreData

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
            }
        } catch {
            print("Error while fetching")
        }
    }
}

#Preview {
    ArtBook()
}
