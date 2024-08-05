//
//  ListViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 4.08.2024.
//

import SwiftUI

struct ListViewExample: View {
    
    @Environment(ApplicationData.self) private var appData
    let colors = [.white, Color(white: 0.95)]
    
    var body: some View {
        List{
            Section(header: Text("Statistics")) {
                HStack {
                    Text("Total Books")
                    Spacer()
                    Text(String(appData.userData.count))
                }
            }
            .headerProminence(.increased)
            Section(header: Text("My Books")) {
                ForEach(appData.userData) { book in
                    CellBook(book: book)
                }
                .headerProminence(.increased)
            }
        }
//        List(appData.userData) { book in
//            let index = appData.userData.firstIndex(where: { $0.id == book.id}) ?? 0
//            
//            CellBook(book: book)
////                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
//                .listRowBackground(index % 2 == 0 ? colors[0] : colors[1])
//                .listRowSeparator(.hidden)
//        }
//        .listStyle(.plain)
    }
}

struct CellBook: View {
    
    let book: Book
    
    var body: some View {
        HStack(alignment: .top) {
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 100)
            VStack(alignment: .leading, spacing: 2) {
                Text(book.title)
                    .bold()
                Text(book.author)
                Text(book.displayYear)
                    .font(.caption)
                Spacer()
            }
            .padding(.top, 5)
            Spacer()
        }
    }
}

#Preview {
    ListViewExample()
        .environment(ApplicationData())
}
