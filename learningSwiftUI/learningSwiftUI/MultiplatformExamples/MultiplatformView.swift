//
//  MultiplatformView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 25.12.2024.
//

import SwiftUI

struct MultiplatformView: View {
    
    @State private var visibility: NavigationSplitViewVisibility = .automatic
    /** Bir file'ın sadece belli platformlarda build olması isteniyorsa Build Phases'ta Compile Sources içerisinde ilgili file için düzenleme yapılmalıdır.*/
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility, sidebar: {
           MenuView()
        }, detail: {
           #if os(macOS)
              MacDetailView()
           #else
              MobileDetailView()
           #endif
        })
    }
}

#Preview {
    MultiplatformView()
}
