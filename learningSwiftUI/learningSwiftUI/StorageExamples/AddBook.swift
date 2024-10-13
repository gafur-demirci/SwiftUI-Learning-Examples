//
//  AddBook.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//

import SwiftUI
import SwiftData

struct AddBook: View {
    @Environment(ApplicationMyData.self) private var appData
    @Environment(\.modelContext) var dbContext
    @State private var titleInput: String = ""
    @State private var yearInput: String = ""

    var body: some View {
       VStack(alignment: .leading, spacing: 10) {
          TextField("Insert Title", text: $titleInput)
             .textFieldStyle(.roundedBorder)
          TextField("Insert Year", text: $yearInput)
             .textFieldStyle(.roundedBorder)
             .keyboardType(.numbersAndPunctuation)
          VStack(alignment: .leading) {
             Text("Author")
             NavigationLink(value: "List Authors", label: {
                Text(appData.selectedAuthor?.name ?? "Select")
             })
          }
          HStack {
             Spacer()
             Button("Save") {
                storeBook()
             }.buttonStyle(.borderedProminent)
          }
          Spacer()
       }.padding()
    }
    func storeBook() {
       let title = titleInput.trimmingCharacters(in: .whitespaces)
       if let year = Int(yearInput), !title.isEmpty {
          let newBook = MineBook(title: title, author: appData.selectedAuthor, cover: "nocover", year: year)
          dbContext.insert(newBook)
          appData.selectedAuthor = nil
          appData.viewPath.removeLast()
       }
    }
}

#Preview {
    AddBook()
       .environment(ApplicationMyData())
       .modelContainer(for: [MineBook.self], inMemory: true)
}
