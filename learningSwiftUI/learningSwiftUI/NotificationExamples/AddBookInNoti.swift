//
//  AddBookInNoti.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 19.12.2024.
//

import SwiftUI

struct AddBookInNoti: View {
    
    @EnvironmentObject var notificationData: NotificationData
    @Environment(\.dismiss) var dismiss
    @State private var titleInput: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                TextField("Insert Title", text: $titleInput)
                    .textFieldStyle(.roundedBorder)
            }
            HStack {
                Spacer()
                Button("Save") {
                    let title = titleInput.trimmingCharacters(in: .whitespaces)
                    if !title.isEmpty {
                        addValue(title: title)
                        dismiss()
                    }
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Add Book")
    }
    
    func addValue(title: String) {
        notificationData.titles.append(title)
        
        let center = NotificationCenter.default
        let namme = Notification.Name("Update Data")
        let info = ["type": title]
        center.post(name: namme, object: nil, userInfo: info)
    }
}

#Preview {
    AddBookInNoti()
        .environmentObject(NotificationData())
}
