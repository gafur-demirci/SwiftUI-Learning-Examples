//
//  MultiplatformView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 25.12.2024.
//

import SwiftUI

struct MultiplatformView: View {
    var body: some View {
        VStack {
            #if os(macOS)
            Text("Mac App!")
            #else
            Text("Mobile App!")
            #endif
        }
        .frame(width: 500, height: 350)
    }
}

#Preview {
    MultiplatformView()
}
