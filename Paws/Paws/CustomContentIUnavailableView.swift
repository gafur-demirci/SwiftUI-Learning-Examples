//
//  SwiftUIView.swift
//  Paws
//
//  Created by Abdulgafur Demirci on 12.04.2025.
//

import SwiftUI

struct CustomContentIUnavailableView: View {
    
    var title: String
    var icon: String
    var description: String
    
    var body: some View {
        ContentUnavailableView {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 96)
            
            Text(title)
                .font(.title)
        } description: {
            Text(description)
        }
        .foregroundStyle(.tertiary)
    }
}

#Preview {
    CustomContentIUnavailableView(
        title: "No Photo",
        icon: "cat.circle",
        description: "Add a photo to get started."
    )
}
