//
//  NotificationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 19.12.2024.
//

import SwiftUI

struct NotificationExample: View {
    
    @Environment(NotificationData.self) private var notificationData
    
    var body: some View {
        Group {
            if notificationData.isLandscape {
                VStack(spacing: 0) {
                    HeaderViewNotification(isCompact: true)
                    BodyViewNotification()
                }
            } else {
                HStack(spacing: 0) {
                    HeaderViewNotification(isCompact: false)
                    BodyViewNotification()
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            let device = UIDevice.current
            device.beginGeneratingDeviceOrientationNotifications()
        }
        .onDisappear {
            let device = UIDevice.current
            device.endGeneratingDeviceOrientationNotifications()
        }
    }
}

struct HeaderViewNotification: View {
    let isCompact: Bool
    
    var body: some View {
        Text("Food Menu")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: isCompact ? 150 : .infinity)
            .background(Color.yellow)
    }
}

struct BodyViewNotification: View {
    
    var body: some View {
        Text("Content Title")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.blue)
    }
}

#Preview {
    NotificationExample()
        .environment(NotificationData())
}
