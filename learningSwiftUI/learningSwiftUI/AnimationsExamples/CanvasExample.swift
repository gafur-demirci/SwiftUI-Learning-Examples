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
            context.addFilter(.colorMultiply(.red))
            context.addFilter(.blur(radius: 5))
            
            let margin = (size.width - 161) / 2
            let imageFrame = CGRect(x: margin, y: margin, width: 161, height: 216)
            context.draw(Image("book1"), in: imageFrame)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CanvasExample()
}
