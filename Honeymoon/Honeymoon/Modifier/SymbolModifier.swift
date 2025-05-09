//
//  SymbolModifier.swift
//  Honeymoon
//
//  Created by Abdulgafur Demirci on 6.05.2025.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.system(size: 128))
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 12, x: 0, y: 0)
    }
}
