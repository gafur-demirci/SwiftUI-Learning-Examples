//
//  GesturesExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct GesturesExample: View {
    
    var body: some View {
        
        Image("book1")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 400)
            .draggable(Image("book1"), preview: {
                Image(systemName: "scope")
                    .font(.system(size: 50))
            })
        Spacer()
    }
}

#Preview {
    GesturesExample()
}
