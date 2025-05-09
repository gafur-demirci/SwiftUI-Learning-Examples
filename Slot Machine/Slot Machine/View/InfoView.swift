//
//  InfoView.swift
//  Slot Machine
//
//  Created by Abdulgafur Demirci on 4.05.2025.
//

import SwiftUI

struct InfoView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(firstText: "Application", secondText: "Slot Machine")
                    FormRowView(firstText: "Platforms", secondText: "iPhone, iPad, Mac")
                    FormRowView(firstText: "Developer", secondText: "John / Jane")
                    FormRowView(firstText: "Designer", secondText: "Robert Petras")
                    FormRowView(firstText: "Music", secondText: "Dan Lebowitz")
                    FormRowView(firstText: "Website", secondText: "swiftui.com")
                    FormRowView(firstText: "Copyright", secondText: "© 2025 All rights reserved")
                    FormRowView(firstText: "Version", secondText: "1.0.0")
                } // SECTION
            } //: FORM
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
                audioPlayer?.stop()
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
            })
            .padding(.top, 30)
            .padding(.trailing, 20)
            .tint(.secondary),
            alignment: .topTrailing
        )
        .onAppear {
            playSound(sound: "background-music", type: "mp3")
        }
    }
}

struct FormRowView: View {
    
    // MARK: - PROPERTIES
    var firstText: String = ""
    var secondText: String = ""
    
    var body: some View {
        HStack {
            Text(firstText)
                .foregroundStyle(.gray)
            Spacer()
            Text(secondText)
        }
    }
}

#Preview {
    InfoView()
}
