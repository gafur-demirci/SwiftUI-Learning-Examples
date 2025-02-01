//
//  UserManager.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import SwiftUI
import SwiftData
import UIKit
/*
class UserManager: ObservableObject {
    @Published var user: User?
    var modelContainer: ModelContainer
    
//    init() {
//        do {
//            self.modelContainer = try ModelContainer(for: User.self)
//            self.user = nil
////            fetchUser()
//        }
//        catch {
//            // Handle error appropriately, perhaps by logging or showing an alert
//            print("Failed to initialize ModelContainer: \(error)")
//            do {
//                self.modelContainer = try ModelContainer()
//                self.user = nil
//            } catch {
//                print("Failed to initialize ModelContainer: \(error)")
//            }
//        }
//    }

//    // Fetch user from the database
//    func fetchUser() {
//        let context = modelContainer.viewContext
//        if let existingUser = try? context.fetch(FetchDescriptor<User>()).first {
//            self.user = existingUser
//        } else {
//            let newUser = User(username: "Yeni Kullanıcı")
//            self.user = newUser
//            context.insert(newUser)
//            do {
//                try context.save()
//            } catch {
//                // Handle error appropriately
//                print("Failed to save context: \(error)")
//            }
//        }
//    }
//    
//    // Update user details
//    func updateUser(username: String, profileImage: UIImage?) {
//        if let user = user {
//            user.username = username
//            user.profileImage = profileImage
//            do {
//                try modelContainer.viewContext.save()
//            } catch {
//                // Handle error appropriately
//                print("Failed to save context: \(error)")
//            }
//        }
//    }

}
*/
