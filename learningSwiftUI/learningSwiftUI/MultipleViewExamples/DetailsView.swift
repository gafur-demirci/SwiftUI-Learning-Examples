//
//  DetailsView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 3.09.2024.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.horizontalSizeClass) var horizontal
//    @Binding var path: NavigationPath
    let book: Book
    
    var body: some View {
        Group {
            if horizontal == .regular {
                DetailLarge(book: book)
//                DetailLarge(path: $path, book: book)
            } else {
                DetailSmall(book: book)
//                DetailSmall(path: $path, book: book)
            }
        }
        .padding()
        .navigationTitle(Text("Information"))
        .navigationDestination(for: String.self, destination: { _ in
            PictureViewExample(book: book)
        })
    }
}

struct DetailLarge: View {
//    @Binding var path: NavigationPath
    let book: Book
    
    var body: some View {
        HStack {
            VStack {
                Button(action: {
//                    path.append("Picture View")
                }, label: {
                    Image(book.cover)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                })
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
//    @Binding var path: NavigationPath
    let book: Book
    
    var body: some View {
        VStack {
            Text(book.title)
                .font(.title)
            Text(book.author)
            Text(book.displayYear)
                .font(.caption)
            Button(action: {
//                path.append("Picture View")
            }, label: {
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300)
            })

        }
        .multilineTextAlignment(.center)
    }
}


#Preview {
    DetailsView(book: ApplicationMyData.shared.userData[2])
//    DetailsView(path: .constant(NavigationPath()), book: ApplicationData().userData[2])
}
