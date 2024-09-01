//
//  HelpView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 1.09.2024.
//

import SwiftUI

struct HelpView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("X") {
                    dismiss()
                }
                .padding(.trailing, 16)
            }
            Text("Press this button when you need help")
                .font(.title)
                .padding()
        }
        .frame(width: 250, height: 250)
    }
}

#Preview {
    HelpView()
}
