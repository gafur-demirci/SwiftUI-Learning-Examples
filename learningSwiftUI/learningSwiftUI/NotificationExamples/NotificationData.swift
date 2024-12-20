//
//  NotificationData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 19.12.2024.
//

import SwiftUI

@Observable class NotificationData {
    
    var total: Int = 0
    var titles: [String] = []
    let center = NotificationCenter.default
    var scrollOffset: CGFloat = 0
    
    init() {
        Task(priority: .background, operation: {
            await receiveNotificationOpen()
        })
        Task(priority: .background, operation: {
            await receiveNotificationClose()
        })
    }
    
    @MainActor
    func receiveNotificationOpen() async {
        let name = UIWindow.keyboardDidShowNotification
        for await _ in center.notifications(named: name, object: nil) {
            scrollOffset = 20
        }
    }
    
    @MainActor
    func receiveNotificationClose() async {
        let name = UIWindow.keyboardDidHideNotification
        for await _ in center.notifications(named: name, object: nil) {
            scrollOffset = 0
        }
    }
}
