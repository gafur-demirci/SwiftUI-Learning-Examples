//
//  User.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import Foundation
import SwiftData
import UIKit

enum UserType: String {
    case admin, customer, seller
}

@Model
class User {
    @Attribute(.unique) var id: UUID
    var username: String
    var profileImageData: Data?
    var password: String  // Şifre yönetimi için
    var userType: UserType
    var lastLoginDate: Date?

    init(username: String, password: String, userType: UserType, lastLoginDate: Date? = nil, profileImageData: Data? = nil) {
        self.id = UUID()
        self.username = username
        self.profileImageData = profileImageData
    }

    // Profil resmi UIImage olarak alınır
    var profileImage: UIImage? {
        get {
            guard let data = profileImageData else { return nil }
            return UIImage(data: data)
        }
        set {
            profileImageData = newValue?.jpegData(compressionQuality: 0.8)
        }
    }
}
