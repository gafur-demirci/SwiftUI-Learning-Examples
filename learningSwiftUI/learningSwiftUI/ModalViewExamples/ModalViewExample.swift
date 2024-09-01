//
//  ModalViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 1.09.2024.
//

import SwiftUI

struct ModalViewExample: View {
    
    @Environment(ApplicationData.self) private var appData
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List(appData.userData) { book in
                BookView(book: book)
            }
            .navigationTitle(Text("Books"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showSheet = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $showSheet, content: {
                AddBookView()
            })
        }
    }
}

#Preview {
    ModalViewExample()
        .environment(ApplicationData())
}
