//
//  ListBooksView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 29.12.2024.
//

import SwiftUI

struct ListOfBooksView: View {
    
    @Environment(ApplicationMyData.self) private var myData
    
    var body: some View {
        List(myData.userData) { book in
            MyCellBook(book: book)
        }
    }
}

struct MyCellBook: View {
    
    @Environment(ApplicationMyData.self) private var appData
    let book: Book
    
    var body: some View {
        HStack(alignment: .top) {
            if appData.showPicture {
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 100)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(book.title).bold()
                    .font(.headline)
                Text(book.author)
                    .font(.subheadline)
                if appData.showYear {
                    Text(book.displayYear)
                        .font(.caption)
                }
                Spacer()
            }
            .padding(.top, 5)
            Spacer()
        }
    }
}

#Preview {
    ListOfBooksView()
        .environment(ApplicationMyData.shared)
}
