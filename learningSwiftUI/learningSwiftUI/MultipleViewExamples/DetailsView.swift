//
//  DetailsView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 3.09.2024.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.horizontalSizeClass) var horizontal
    let book: Book
    
    var body: some View {
        Group {
            if horizontal == .regular {
                DetailLarge(book: book)
            } else {
                DetailSmall(book: book)
            }
        }
        .padding()
        .navigationTitle(Text("Information"))
    }
}

struct DetailLarge: View {
    
    let book: Book
    
    var body: some View {
        HStack {
            VStack {
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 4, content: {
                Text(book.title)
                    .font(.title)
                Text(book.author)
                Text(book.displayYear)
                Spacer()
            })
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }
}

struct DetailSmall: View {
    
    let book: Book
    
    var body: some View {
        VStack {
            Text(book.title)
                .font(.title)
            Text(book.author)
            Text(book.displayYear)
                .font(.caption)
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300)
        }
        .multilineTextAlignment(.center)
    }
}


#Preview {
    DetailsView(book: ApplicationData().userData[2])
}
