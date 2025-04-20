//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Abdulgafur Demirci on 20.04.2025.
//

import SwiftUI

struct InfoPanelView: View {
    
    // MARK: - PROPERTIES
    
    var scale: CGFloat
    var offset: CGSize
    @State private var isInfoPanelVisible: Bool = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    InfoPanelView(scale: 1.0, offset: .zero)
}
