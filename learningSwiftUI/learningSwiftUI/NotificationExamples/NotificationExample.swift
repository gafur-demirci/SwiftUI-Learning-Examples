//
//  NotificationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 19.12.2024.
//

import SwiftUI
import UserNotifications

struct NotificationExample: View {
    
    @State private var inputMessage: String = ""
    @State private var isButtonDisabled: Bool = false
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Message:")
                TextField("Insert message", text: $inputMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Spacer()
                Button("Post Notification") {
                    let message = inputMessage.trimmingCharacters(in: .whitespaces)
                    if !message.isEmpty {
                        Task(priority: .background) {
                            let center = UNUserNotificationCenter.current()
                            let authrorization = await center.notificationSettings()
                            if authrorization.authorizationStatus == .authorized {
                                await sendNotificaiton()
                            }
                        }
                    }
                }
                .disabled(isButtonDisabled)
            }
            Spacer()
        }
        .padding()
        .task(priority: .background) {
            do {
                let center = UNUserNotificationCenter.current()
                let authrorized = try await center.requestAuthorization(options: [.alert, .sound])
                await MainActor.run {
                    isButtonDisabled = !authrorized
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func sendNotificaiton() async {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = inputMessage
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
        let id = "reminder-\(UUID())"
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        do {
            let center = UNUserNotificationCenter.current()
            try await center.add(request)
            await MainActor.run {
                inputMessage = ""
            }
        } catch {
            print("Error: \(error)")
        }
    }
}

#Preview {
    NotificationExample()
}
