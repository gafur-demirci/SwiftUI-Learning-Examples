//
//  GesturesExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct GesturesExample: View {
    
    @GestureState private var pressing: Bool = false
    @State private var expanded: Bool = false
    
    var body: some View {
        
        Image("book1")
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 200)
            .opacity(pressing ? 0 : 1)
            .gesture(
                LongPressGesture(minimumDuration: 1)
                    .updating($pressing) { value, state, transaction in
                        state = value
                        transaction.animation = Animation.easeInOut(duration: 1.5)
                    }
                    .onEnded { value in
                        expanded = true
                    }
            )
            .sheet(isPresented: $expanded, content: {
                ShowImage()
            })
    }
}

#Preview {
    GesturesExample()
}
