//
//  CustomVideoView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 24.12.2024.
//

import SwiftUI
#if os(iOS)
struct CustomVideoView: View {
    
    @Environment(CustomPlayerData.self ) private var playerData
    
    var body: some View {
        ZStack {
            playerData.customVideoView
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Button(playerData.playing ? "Pause" : "Play") {
                        playerData.playVideo()
                    }
                    .frame(width: 70)
                    .foregroundStyle(.black)
                    GeometryReader { geometry in
                        HStack {
                            Rectangle()
                                .fill(Color(red: 0, green: 0.4, blue: 0.8, opacity: 0.8))
                                .frame(width: geometry.size.width * playerData.progress, height: 20)
                            Spacer()
                        }
                    }
                    .padding(.top, 15)
                }
                .padding([.leading, .trailing])
                .frame(height: 50)
                .background(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.8))
            }
        }
    }
}

#Preview {
    CustomVideoView()
        .environment(CustomPlayerData())
}
#endif
