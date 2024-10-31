//
//  AddAuthor.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//

import SwiftUI
import SwiftData

struct AddAuthor: View {
    @Environment(ApplicationData.self) private var appData
    @Environment(\.modelContext) var dbContext
    @State private var nameInput: String = ""
    @State private var openAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField("Insert Name", text: $nameInput)
                .textFieldStyle(.roundedBorder)
            HStack {
                Spacer()
                Button("Save") {
                    storeAuthor()
                }.buttonStyle(.borderedProminent)
            }
            Spacer()
        }.padding()
    }
    func storeAuthor() {
        let name = nameInput.trimmingCharacters(in: .whitespaces)
        if !name.isEmpty {
            let newAuthor = Author(name: name, books: [])
            dbContext.insert(newAuthor)
            appData.selectedAuthor = newAuthor
            appData.viewPath.removeLast(2)
        }
    }
}

#Preview {
    NavigationStack {
        AddAuthor()
            .environment(ApplicationData())
            .modelContainer(for: [MineBook.self, Author.self], inMemory: true)
    }
}
