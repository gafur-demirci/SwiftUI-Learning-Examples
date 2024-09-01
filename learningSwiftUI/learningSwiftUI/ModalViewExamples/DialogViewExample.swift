//
//  DialogViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 1.09.2024.
//

import SwiftUI

struct DialogViewExample: View {
    
    @State private var openDialog: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Button("Open Confirmation Dialog") {
                openDialog = true
            }
            Spacer()
        }
        .padding()
        .confirmationDialog("Email", isPresented: $openDialog, actions: {
            Button("Move to Inbox", role: .none, action: {})
            Button("Delete", role: .destructive, action: {})
            Button("Cancel", role: .cancel, action: {})
        }, message: {
            Text("What do you wnat to do with the message?")
        })
    }
}

#Preview {
    DialogViewExample()
}
