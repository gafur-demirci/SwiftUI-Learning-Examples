//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Abdulgafur Demirci on 6.05.2025.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.pink)
    }
}
