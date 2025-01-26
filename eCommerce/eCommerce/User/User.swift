//
//  User.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import Foundation
import SwiftData
import UIKit

@Model
class User {
    @Attribute(.unique) var id: UUID
    var username: String
    var profileImageData: Data?

    init(username: String, profileImageData: Data? = nil) {
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

//@Model
//class User {
//    @Attribute(.primaryKey) var id: UUID
//    @Attribute(.required) var username: String
//    @Attribute(.optional) var profileImage: UIImage?
//    
//    init(username: String, profileImage: UIImage? = nil) {
//        self.username = username
//        self.profileImage = profileImage
//        self.id = UUID()
//    }
//}
