//
//  GesturesExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct GesturesExample: View {
    
    @State private var selected: Bool = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("book1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 100)
                    .border(selected ? Color.red : Color.blue, width: 5)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Steeve Jobs").bold()
                    Text("Apple Inc")
                    Text("San Francisco, CA")
                        .font(.caption)
                    Spacer()
                }
                Spacer()
            }
            .frame(height: 100)
            .padding(5)
            .border(.gray, width: 1)
            .contentShape(Rectangle())
            .onTapGesture {
                selected.toggle()
            }
            Spacer()
        }
    }
}

#Preview {
    GesturesExample()
}
