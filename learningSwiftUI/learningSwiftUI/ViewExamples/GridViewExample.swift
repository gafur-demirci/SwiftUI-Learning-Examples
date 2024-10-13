//
//  GridViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 3.08.2024.
//

import SwiftUI

struct GridViewExample: View {
    
    @Environment(ApplicationMyData.self) private var appData
    
    let guides = [
        GridItem(.adaptive(minimum: 75)),
//        GridItem(.flexible(minimum: 75), alignment: .top),
//        GridItem(.fixed(75))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: guides) {
                ForEach(appData.userData) { book in
                    Image(book.cover)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .padding()
    }
}

#Preview {
    GridViewExample()
        .environment(ApplicationData())
}
