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
        let myTask = Task(priority: .background, operation: {
            await readNotifications()
        })
        Timer.scheduledTimer(withTimeInterval: 20, repeats: false) { timer in
            myTask.cancel()
        }
    }
    
    func readNotifications() async {
        let center = NotificationCenter.default
        let name = Notification.Name("Update Data")
        
        for await notification in center.notifications(named: name, object: nil) {
            if let info = notification.userInfo {
                let type = info["type"] as? String
                if type == "Miracle" {
                    print("Miracle title was inserted")                    
                }
            }
            await MainActor.run {
                total = titles.count
            }
        }
    }
}
