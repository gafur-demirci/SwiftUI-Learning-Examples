//
//  ContentView.swift
//  Pinch
//
//  Created by Abdulgafur Demirci on 18.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: PROPERTIES
    
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(imageScale)
                // MARK: - 1. TAP GESTURE
                    .onTapGesture(count: 2) {
                        if self.imageScale == 1 {
                            withAnimation(.spring) {
                                self.imageScale = 5
                            }
                        } else {
                            withAnimation(.spring) {
                                self.imageScale = 1
                            }
                        }
                    }
            } //: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    self.isAnimating = true
                }
            }
        } //: NAVIGATION
    }
}

#Preview {
    ContentView()
}
