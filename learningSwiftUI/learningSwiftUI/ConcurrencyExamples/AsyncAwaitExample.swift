//
//  AsyncAwaitExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 11.09.2024.
//

import SwiftUI

struct AsyncAwaitExample: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
        }
        .task(priority: .background, {
            let imageName = await loadImage(name: "book1")
            print(imageName)
        })
    }
    
    func loadImage(name: String) async -> String {
        try? await Task.sleep(nanoseconds: 3 * 1000000000)
        return "Name: \(name)"
    }
    
}

#Preview {
    AsyncAwaitExample()
}
