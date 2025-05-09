//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Abdulgafur Demirci on 6.05.2025.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: - PROPERTIES
    
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    let haptics = UINotificationFeedbackGenerator()
    
    var body: some View {
        HStack {
            Button(action: {
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
                self.showInfoView.toggle()
            }, label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            })
            .tint(Color.primary)
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button(action: {
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
                self.showGuideView.toggle()
            }, label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            })
            .tint(Color.primary)
            .sheet(isPresented: $showGuideView, content: {
                GuideView()
            })
        } //: HSTACK
        .padding()
    }
}

#Preview {
    @Previewable @State var showGuide: Bool = false
    @Previewable @State var showInfo: Bool = false
    HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
}
