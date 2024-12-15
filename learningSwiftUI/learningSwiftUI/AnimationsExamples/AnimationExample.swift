//
//  AnimationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct AnimationExample: View {
    
    @State private var showInfo: Bool = false
    
    var body: some View {
        VStack {
            Button("Show Information") {
                withAnimation {
                    showInfo.toggle()
                }
            }
            .padding()
            if showInfo {
                Text("This is the information")
                    .transition(.offset(x: 400, y: 0))
            }
            Spacer()
        }
    }
}

#Preview {
    AnimationExample()
}
