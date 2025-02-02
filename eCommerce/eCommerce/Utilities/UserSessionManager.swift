//
//  UserSessionManager.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 2.02.2025.
//

import SwiftData
import SwiftUI

@Observable
class UserSessionManager: ObservableObject {
    var currentUser: User?

    func login(user: User) {
        currentUser = user
    }

    func logout() {
        currentUser = nil
    }
}
