//
//  ThemeSettings.swift
//  Todo
//
//  Created by Abdulgafur Demirci on 5.05.2025.
//

import SwiftUI

// MARK: - THEME CLASS

class ThemeSettings: ObservableObject {
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
        }
    }
    private init() {}
    public static let shared = ThemeSettings()
}
