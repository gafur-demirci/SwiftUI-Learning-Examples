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
            context.translateBy(x: size.width/2, y: size.height/2)
            context.rotate(by: .degrees(45))
            
            let width: CGFloat = 161
            let height: CGFloat = 216
            let imageFrame = CGRect(x: -width/2, y: -height/2, width: width, height: height)
            context.draw(Image("book3"), in: imageFrame)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CanvasExample()
}
