//
//  FormRowStaticView.swift
//  Todo
//
//  Created by Abdulgafur Demirci on 4.05.2025.
//

import SwiftUI

struct FormRowStaticView: View {
    // MARK: - PROPERTIES
    
    var icon: String
    var firstTitle: String
    var secondTitle: String
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.gray)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(firstTitle)
                .foregroundStyle(.gray)
                .font(.caption)
            
            Spacer()
            
            Text(secondTitle)
        } //: HSTACK
    }
}

#Preview {
    FormRowStaticView(icon: "gear", firstTitle: "Application", secondTitle: "Todo")
}
