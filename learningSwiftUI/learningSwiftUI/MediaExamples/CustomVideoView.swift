//
//  CustomVideoView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 24.12.2024.
//

import SwiftUI

struct CustomVideoView: View {
    
    @Environment(CustomPlayerData.self ) private var playerData
    
    var body: some View {
        playerData.customVideoView
            .ignoresSafeArea()
    }
}

#Preview {
    CustomVideoView()
        .environment(CustomPlayerData())
}
