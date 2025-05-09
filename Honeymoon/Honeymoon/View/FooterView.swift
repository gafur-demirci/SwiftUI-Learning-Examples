//
//  FooterView.swift
//  Honeymoon
//
//  Created by Abdulgafur Demirci on 6.05.2025.
//

import SwiftUI

struct FooterView: View {
    
    // MARK: - PROPERTIES
    
    @Binding var showBookingAlert: Bool
    let haptics = UINotificationFeedbackGenerator()
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button(action: {
                print("Success!")
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
                self.showBookingAlert.toggle()
            }, label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .tint(Color.pink)
                    .background(
                        Capsule()
                            .stroke(.pink, lineWidth: 2)
                    )
            })
            
            Spacer()
            
            Image(systemName: "heart.fill")
                .font(.system(size: 42, weight: .light))
        } //: HSTACK
        .padding()
    }
}

#Preview {
    @Previewable @State var showAlert: Bool = false
    FooterView(showBookingAlert: $showAlert)
}
