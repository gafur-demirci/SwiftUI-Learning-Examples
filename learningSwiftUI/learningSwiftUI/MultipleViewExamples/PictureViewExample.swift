//
//  PictureView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 4.09.2024.
//

import SwiftUI

struct PictureViewExample: View {
    
    @Environment(\.horizontalSizeClass) var horizontal
    let book: Book
    
    var body: some View {
        VStack {
            if horizontal == .regular {
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .padding([.top, .bottom], 20)
                    .padding([.leading, .trailing], 50)
            } else {
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PictureViewExample(book: ApplicationData().userData[0])
    }
}