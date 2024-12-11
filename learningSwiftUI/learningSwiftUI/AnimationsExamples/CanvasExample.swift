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
            let imageFrame = CGRect(x: 60, y: 75, width: 161, height: 216)
            context.draw(Image("book3"), in: imageFrame)
            context.rotate(by: .degrees(20))
            context.draw(Image("book3"), in: imageFrame)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CanvasExample()
}
