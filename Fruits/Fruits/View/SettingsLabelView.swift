//
//  SettingsLabelView.swift
//  Fruits
//
//  Created by Abdulgafur Demirci on 22.04.2025.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - PROPERTIES
    
    var labelText: String
    var labelImage: String

    // MARK: - BODY

    var body: some View {
      HStack {
        Text(labelText.uppercased()).fontWeight(.bold)
        Spacer()
        Image(systemName: labelImage)
      }
    }
}

#Preview {
    SettingsLabelView(labelText: "Fruits", labelImage: "info.circle")
}
