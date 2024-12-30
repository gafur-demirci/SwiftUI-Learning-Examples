//
//  ListViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 4.08.2024.
//

import SwiftUI

struct ListViewExample: View {
    
    @Environment(ApplicationMyData.self) private var appData
    let colors = [.white, Color(white: 0.95)]
    
    var orderList: [(key: String, value: [Book])] {
        let listGroup: [String: [Book]] = Dictionary(grouping: appData.userData, by: { value in
            let index = value.title.startIndex
            let initial = value.title[index]
            return String(initial)
        })
        return listGroup.sorted(by: { $0.key < $1.key })
    }
    
    @State private var selectedRows: Set<Book.ID> = []
    @State private var editActive: Bool = false
    
    var body: some View {
        List {
            ForEach(appData.items) { section in
                Section(header: Text(section.name)) {
                    OutlineGroup(section.options ?? [], children: \.options) { item in
                        Text(item.name)
                    }
                }
                
            }
        }
    }
}


struct CellBook: View {
    
    @Environment(ApplicationMyData.self) private var appData
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
            
            Button(action: {
                removeBook(book: book)
            }, label: {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .frame(width: 30, height: 30)
            })
            .padding(.top, 5)
            .buttonStyle(.plain)
            
            //            if book.selected {
            //                Image(systemName: "checkmark")
            //                    .foregroundColor(.green)
            //                    .frame(width: 25, height: 25)
            //            }
        }
    }
    
    func removeBook(book: Book) {
        var indexes = IndexSet()
        if let index = appData.userData.firstIndex(where: {$0.id == book.id }) {
            indexes.insert(index)
        }
        appData.userData.remove(atOffsets: indexes)
    }
}

#Preview {
    ListViewExample()
        .environment(ApplicationMyData.shared)
}
