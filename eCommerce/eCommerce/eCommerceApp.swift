//
//  eCommerceApp.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 23.01.2025.
//

import SwiftUI
import SwiftData
import CoreData

struct ModelContainerKey: EnvironmentKey {
    static var defaultValue: ModelContainer? = nil
}

extension EnvironmentValues {
    var modelContainer: ModelContainer? {
        get { self[ModelContainerKey.self] }
        set { self[ModelContainerKey.self] = newValue }
    }
}

@main
struct eCommerceApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared
    
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [User.self, Product.self]) // SwiftData için modeller
                .onAppear {
                    addDefaultData()
                }
        }
        .modelContainer(for: [Product.self])
    }
    
    private func addDefaultData() {
        let appDelegate = AppDelegate()
        let context = appDelegate.persistentContainer.viewContext
        let defaultDataManager = DefaultDataManager(context: context)
        defaultDataManager.addDefaultDataIfNeeded()
    }
    
    func addNewArt() {
        let appDelegate = AppDelegate()
        let context = appDelegate.persistentContainer.viewContext
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paints", into: context)
        
        
        do {
            try context.save()
            print("Saved")
        } catch {
            print("Error while saving")
        }
    }
}
