//
//  PopoverView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 1.09.2024.
//

import SwiftUI

struct PopoverViewExample: View {
    
    @State private var showPopover: Bool = false
    
    var body: some View {
        VStack {
            Button("Show Popover") {
                showPopover = true
            }
            .popover(isPresented: $showPopover, arrowEdge: .top, content: {
                HelpView()
            })
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    PopoverViewExample()
}
