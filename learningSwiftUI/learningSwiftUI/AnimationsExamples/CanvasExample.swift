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
            let imageFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
            context.translateBy(x: size.width/2, y: size.height/2)
            
            let clipFrame = CGRect(x: -100, y: -100, width: 200, height: 200)
            context.clip(to: Circle().path(in: clipFrame))
            
            for _ in 0..<10 {
                context.rotate(by: .degrees(36))
                context.draw(Image("book1"), in: imageFrame)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CanvasExample()
}
