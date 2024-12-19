//
//  NotificationData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 19.12.2024.
//

import SwiftUI

class NotificationData: ObservableObject {
    
    @Published var total: Int = 0
    var titles: [String] = []
    
    init() {
        Task(priority: .background, operation: {
            await readNotifications()
        })
    }
    
    func readNotifications() async {
        let center = NotificationCenter.default
        let name = Notification.Name("Update Data")
        
        for await _ in center.notifications(named: name, object: nil) {
            await MainActor.run {
                total = titles.count
            }
        }
    }
}
