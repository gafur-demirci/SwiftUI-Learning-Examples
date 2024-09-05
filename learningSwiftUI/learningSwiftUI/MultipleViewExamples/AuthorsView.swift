//
//  AuthorsView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 5.09.2024.
//

import SwiftUI

struct AuthorsView: View {
    
    @Environment(ApplicationData.self) private var appData
    @Binding var selectedAuthor: String?
    
    var body: some View {
        List(appData.listAuthors, id: \.self, selection: $selectedAuthor) { author in
            NavigationLink(value: author, label: {
                Text(author)
            })
        }
        .listStyle(.sidebar)
        .navigationTitle("Authors")
    }
}

#Preview {
    AuthorsView(selectedAuthor: .constant(nil))
        .environment(ApplicationData())
}
