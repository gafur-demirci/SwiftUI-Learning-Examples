//
//  CanvasExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 8.12.2024.
//

import SwiftUI

struct CanvasExample: View {
    var body: some View {
        Canvas { context, size in
            let imageFrame = CGRect(origin: .zero, size: size)
            context.draw(Image("book3"), in: imageFrame)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CanvasExample()
}
