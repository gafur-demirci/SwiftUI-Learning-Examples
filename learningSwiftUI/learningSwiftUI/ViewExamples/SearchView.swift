//
//  SearchView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 29.12.2024.
//

import SwiftUI

struct SearchView: View {
    @Environment(ApplicationMyData.self) private var myData
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("Insert Title", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
            List(myData.filteredItems) { book in
                MyCellBook(book: book)
            }
        }
        .onChange(of: text, initial: true, {
            myData.filterValues(search: text)
        })
    }
}

#Preview {
    SearchView()
        .environment(ApplicationMyData.shared)
}
