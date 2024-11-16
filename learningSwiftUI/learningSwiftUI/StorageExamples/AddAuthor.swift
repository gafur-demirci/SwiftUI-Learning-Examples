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
    @State private var birthDay: Date = Date()
    @State private var placeOfBirth: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField("Insert Name", text: $nameInput)
                .textFieldStyle(.roundedBorder)
            DatePicker("Birthday", selection: $birthDay, displayedComponents: .date)
            TextField("Insert Address", text: $placeOfBirth)
            HStack {
                Spacer()
                Button("Save") {
                    storeAuthor()
                }.buttonStyle(.borderedProminent)
            }
            Spacer()
        }.padding()
            .alert("Error", isPresented: $openAlert, actions: {
                Button("OK", role: .cancel, action: {})
            }, message: {
                Text("The Author already exist")
            })
    }
    func storeAuthor() {
        let name = nameInput.trimmingCharacters(in: .whitespaces)
        if !name.isEmpty {
            let predicate = #Predicate<Author> { $0.name == name }
            let descriptor = FetchDescriptor<Author>(predicate: predicate)
            if let count = try? dbContext.fetchCount(descriptor), count > 0 {
                openAlert = true
            } else {
                let newAuthor = Author(name: name, books: [], info: archiveInfo())
                dbContext.insert(newAuthor)
                appData.selectedAuthor = newAuthor
                appData.viewPath.removeLast(2)
            }
        }
    }
    func archiveInfo() -> Data? {
        var newBirthday = Date.distantFuture
        if birthDay < Date(timeIntervalSinceNow: -86400) {
            newBirthday = birthDay
        }
        let authorInfo = AuthorInfo(birthDay: newBirthday, placeOfBirth: placeOfBirth)
        let encoder = PropertyListEncoder()
        let infoData = try! encoder.encode(authorInfo)
        return infoData
    }
}

#Preview {
    NavigationStack {
        AddAuthor()
            .environment(ApplicationData())
            .modelContainer(for: [MineBook.self, Author.self], inMemory: true)
    }
}
