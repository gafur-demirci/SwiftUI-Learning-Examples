//
//  BoxListView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 28.12.2024.
//

import SwiftUI

struct BoxListView<Content: View>: View {
    
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack {
            if #available(iOS 18.0, *) {
                ForEach(subviews: content) { subview in
                    HStack {
                        subview
                            .padding()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .border(.red, width: 5)
                    .padding(5)
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

#Preview {
    BoxListView {
        Text("Test")
    }
}
