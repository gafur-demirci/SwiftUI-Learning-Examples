//
//  DetailView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 18.08.2024.
//

import SwiftUI

struct DetailView: View {
    
//    @Binding var viewPath: NavigationPath
    @Environment(ApplicationData.self) private var appData
    let book: Book
    
    var body: some View {
        VStack {
            Text(book.title)
                .font(.title)
            Text(book.author)
            Button(action: {
                appData.selectedBook = book
                appData.viewPath.append("Picture View")
            }, label: {
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            })
            Spacer()
        }
        .padding()
        .navigationTitle(Text("Book"))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading, content: {
                Button("Go Back") {
                    appData.viewPath.removeLast()
                }
            })
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(book: ApplicationMyData().userData[0])
            .environment(ApplicationMyData())
//        DetailView(viewPath: .constant(NavigationPath()), book: ApplicationData().userData[0])
    }
    
}
