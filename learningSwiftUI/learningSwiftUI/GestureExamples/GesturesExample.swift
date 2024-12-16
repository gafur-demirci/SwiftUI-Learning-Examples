//
//  GesturesExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

enum PressingState {
    case inactive
    case active
    
    var isActive: Bool {
        switch self {
        case .active: return true
        case .inactive: return false
        }
    }
}

struct GesturesExample: View {
    
    @GestureState private var pressingState: PressingState = .inactive
    @State private var expanded: Bool = false
    
    var body: some View {
        
        Image("book1")
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 200)
            .opacity(pressingState.isActive ? 0 : 1)
            .gesture(
                LongPressGesture(minimumDuration: 1)
                    .updating($pressingState) { value, state, transaction in
                        state = value ? .active : .inactive
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
