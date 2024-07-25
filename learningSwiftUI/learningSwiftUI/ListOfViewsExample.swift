//
//  ListOfViewsExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.07.2024.
//

import SwiftUI

struct ListOfViewsExample: View {
    
    let listCities: [String] = ["Paris","Toronto","Dublin"]
    @Environment(ApplicationData.self) private var appData
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(appData.userData) { book in
                    VStack {
                        HStack(alignment: .top) {
                            Image(book.cover)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 100)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(book.title)
                                    .bold()
                                Text(book.author)
                                Text(book.displayYear)
                                    .font(.caption)
                            }
                            .padding(.top, 5)
                            Spacer()
                        }
                        .padding([.leading, .trailing], 5)
                        Divider()
                    }
                }
                Spacer()
            }
        }
        
    }
}

#Preview {
    ListOfViewsExample()
        .environment(ApplicationData())
}
