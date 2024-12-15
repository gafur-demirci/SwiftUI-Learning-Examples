//
//  GesturesExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct GesturesExample: View {
    
    @State private var expanded: Bool = false
    
    var body: some View {
        Image("book1")
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 200)
            .onTapGesture {
                expanded = true
            }
            .sheet(isPresented: $expanded) {
                ShowImage()
            }
    }
}

#Preview {
    GesturesExample()
}
