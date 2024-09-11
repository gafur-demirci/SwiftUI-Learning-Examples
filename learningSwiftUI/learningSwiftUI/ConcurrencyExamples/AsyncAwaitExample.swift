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
            let imageName1 = await loadImage(name: "book1")
            let imageName2 = await loadImage(name: "book2")
            let imageName3 = await loadImage(name: "book3")
            print("\(imageName1), \(imageName2) and \(imageName3)")
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
