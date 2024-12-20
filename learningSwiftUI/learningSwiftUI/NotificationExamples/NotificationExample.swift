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
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "soundNoti.mp3"))
        
        let imageId = "attach-\(UUID())"
        if let urlImage = await getThumbnail(id: imageId) {
            if let attachment = try? UNNotificationAttachment(identifier: imageId, url: urlImage, options: nil) {
                content.attachments = [attachment] as [UNNotificationAttachment]
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
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
    
    func getThumbnail(id: String) async -> URL? {
        let manager = FileManager.default
        if let docUrl = manager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let url = docUrl.appendingPathComponent("\(id).png")
            if let image = UIImage(named: "book1") {
                if let thumbnail = await image.byPreparingThumbnail(ofSize: CGSize(width: 100, height: 100)) {
                    if let imageData = thumbnail.pngData() {
                        if let _ = try? imageData.write(to: url) {
                            return url
                        }
                    }
                }
            }
        }
        return nil
    }
}

#Preview {
    NotificationExample()
}
