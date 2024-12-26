//
//  MultiplatformView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 25.12.2024.
//

import SwiftUI

struct MultiplatformView: View {
    
    var body: some View {
        NavigationSplitView(sidebar: {
            MenuView()
        }, detail: {
            MacDetailView()
        })
    }
}

#Preview {
    MultiplatformView()
}
