//
//  NotificationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 19.12.2024.
//

import SwiftUI

struct NotificationExample: View {
    
    @FocusState var focusTitle: Bool
    @State var inputTitle: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Image("book1")
                    .resizable()
                    .scaledToFit()
                HStack {
                    TextField("Insert Title", text: $inputTitle)
                        .textFieldStyle(.roundedBorder)
                        .focused($focusTitle)
                    Button("Save") {
                        focusTitle = false
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    NotificationExample()
}
