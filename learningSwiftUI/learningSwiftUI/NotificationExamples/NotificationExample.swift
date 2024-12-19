//
//  NotificationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 19.12.2024.
//

import SwiftUI

struct NotificationExample: View {
    
    @EnvironmentObject var notificationData: NotificationData
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Total Books:")
                    Text("\(notificationData.total)")
                        .font(.largeTitle)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Books")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add Book", destination: {
                            AddBookInNoti()
                    })
                }
            }
        }
    }
}

#Preview {
    NotificationExample()
        .environmentObject(NotificationData())
}
