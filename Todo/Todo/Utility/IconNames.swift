//
//  IconNames.swift
//  Todo
//
//  Created by Abdulgafur Demirci on 5.05.2025.
//

import SwiftUI

// MARK: - ALTERNATE ICONS

class IconNames: ObservableObject {
    var iconNames: [String?] = [nil]
    @Published var currentIndex = 0
    
    init() {
        getAlternateIconNames()
        
        if let currrentIcon = UIApplication.shared.alternateIconName {
            print(currrentIcon)
            self.currentIndex = iconNames.firstIndex(of: currrentIcon) ?? 0
        }
    }
    
    func getAlternateIconNames() {
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any], let alternateIcons = icons["CFBundleAlternateIcons"] as? [String: Any] {
            for(_, value) in alternateIcons {
                guard let iconList = value as? Dictionary<String, Any> else { return }
                guard let iconFiles = iconList["CFBundleIconFiles"] as? [String] else { return }
                guard let icon = iconFiles.first else { return }
                
                iconNames.append(icon)
            }
        }
    }
}
