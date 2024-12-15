//
//  GesturesExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct GesturesExample: View {
    
    @State private var expanded: Bool = false
    @State private var pressing: Bool = false
    
    var body: some View {
        Image("book1")
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 200)
            .opacity(pressing ? 0 : 1)
            .onLongPressGesture(minimumDuration: 1, maximumDistance: 10, perform: {
                expanded = true
            }, onPressingChanged: { value in
                withAnimation(.easeInOut(duration: 1.5)) {
                    pressing = value
                }
            })
            .sheet(isPresented: $expanded) {
                ShowImage()
            }
    }
}

#Preview {
    GesturesExample()
}
