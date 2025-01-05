//
//  BookStoreGallery.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 5.01.2025.
//

import SwiftUI

struct BookStoreGallery: View {
    
    @State var index: Int = 0
    @State var name: String = "nocover"
    
    var body: some View {
        VStack {
            Image(name)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                .onTapGesture {
                    if index == 0 && name == "nocover" {
                        index += 1
                        name = "book\(index)"
                    } else if name != "nocover" && index != 12 {
                        index += 1
                        name = "book\(index)"
                    } else if index == 12 {
                        index = 0
                        name = "nocover"
                    }
                }
            Text(name)
                .font(.title.bold())
                .padding()
        }
    }
}

#Preview {
    BookStoreGallery()
}
