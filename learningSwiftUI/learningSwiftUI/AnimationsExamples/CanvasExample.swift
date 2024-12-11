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
            var copyContext = context
            copyContext.translateBy(x: size.width/2, y: size.height/2)
            copyContext.rotate(by: .degrees(45))
            let imageFrame = CGRect(x: -85, y: -100, width: 161, height: 216)
            copyContext.draw(Image("book1"), in: imageFrame)
            
            let center = size.width/2
            let rectFrame = CGRect(x: center - 125, y: 160, width: 250, height: 40)
            context.fill(RoundedRectangle(cornerRadius: 25).path(in: rectFrame),with: .color(.yellow))
            
            let textPos = CGPoint(x: center, y: 180)
            context.draw(Text("My Picture").font(.title.bold()), at: textPos, anchor: .center)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CanvasExample()
}
