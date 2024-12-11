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
            let imageSize = CGSize(width: 161, height: 216)
            let posX = (size.width - imageSize.width) / 2
            let posY = posX
            
            let imageFrame = CGRect(x: posX, y: posY, width: imageSize.width, height: imageSize.height)
            context.draw(Image("book3"), in: imageFrame)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CanvasExample()
}
