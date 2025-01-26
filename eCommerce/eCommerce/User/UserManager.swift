//
//  UserManager.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import SwiftUI
import SwiftData

class UserManager: ObservableObject {
    @Published var user: User?
    var modelContainer: ModelContainer
    // ModelContext'i tanımlıyoruz
    var context: ModelContext {
        modelContainer.viewContext
    }

    init() {
        // ModelContainer'ı başlatıyoruz
        self.modelContainer = try! ModelContainer(for: User.self)
        self.context = modelContainer.viewContext
        fetchUser()
    }

    // Kullanıcıyı veritabanından getir
    func fetchUser() {
        let context = modelContainer.viewContext
        if let existingUser = try? context.fetch(FetchDescriptor<User>()).first {
            self.user = existingUser
        } else {
            let newUser = User(username: "Yeni Kullanıcı")
            self.user = newUser
            context.insert(newUser)
            try? context.save()
        }
    }

    // Kullanıcıyı güncelle
    func updateUser(username: String, profileImage: UIImage?) {
        if let user = user {
            user.username = username
            user.profileImage = profileImage
            try? modelContainer.viewContext.save()
        }
    }
}
