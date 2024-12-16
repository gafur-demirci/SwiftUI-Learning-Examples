//
//  GesturesExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct GesturesExample: View {
    
    @GestureState private var magnification: CGFloat = 1
    @State private var zoom: CGFloat = 1
    
    var body: some View {
        
        Image("book1")
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 200)
            .scaleEffect(getCurrentZoom(magnification: magnification))
            .gesture(
                MagnificationGesture()
                    .updating($magnification) { value, state, transaction in
                        state = value
                    }
                    .onEnded({ value in
                        zoom = getCurrentZoom(magnification: value)
                    })
            )
    }
    
    func getCurrentZoom(magnification: CGFloat) -> CGFloat {
        let minZoom: CGFloat = 1
        let maxZoom: CGFloat = 2
        
        var current = zoom * magnification
        current = max(min(current, maxZoom), minZoom)
        
        return current
    }
}

#Preview {
    GesturesExample()
}
