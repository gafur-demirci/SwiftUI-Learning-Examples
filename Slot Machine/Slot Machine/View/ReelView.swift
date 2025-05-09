//
//  ReelView.swift
//  Slot Machine
//
//  Created by Abdulgafur Demirci on 4.05.2025.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier())
    }
}

#Preview {
    ReelView()
}
