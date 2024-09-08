//
//  AdaptivityExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 8.09.2024.
//

import SwiftUI

struct AdaptivityExample: View {
    
    @Environment(\.horizontalSizeClass) var horizontalClass
    
    var body: some View {
        Group {
            if horizontalClass == .compact {
                VStack(spacing: 0, content: {
                    HeaderView(isCompact: true)
                    BodyView()
                })
            }else {
                HStack(spacing: 0) {
                    HeaderView(isCompact: false)
                    BodyView()
                }
            }
        }
    }
}

struct HeaderView: View {
    
    let isCompact: Bool
    
    var body: some View {
        Text("Food Menu")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: isCompact ? 150 : .infinity)
            .background(Color.yellow)
    }
}

struct BodyView: View {
    
    var body: some View {
        Text("Content Title")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.gray)
    }
}

#Preview {
    AdaptivityExample()
}
