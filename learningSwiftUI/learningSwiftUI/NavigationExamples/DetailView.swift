//
//  DetailView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 18.08.2024.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var viewPath: NavigationPath
    let book: Book
    
    var body: some View {
        VStack {
            Text(book.title)
                .font(.title)
            Text(book.author)
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            Spacer()
        }
        .padding()
        .navigationTitle(Text("Book"))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading, content: {
                Button("Go Back") {
                    viewPath.removeLast()
                }
            })
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(viewPath: .constant(NavigationPath()), book: ApplicationData().userData[0])
    }
    
}
