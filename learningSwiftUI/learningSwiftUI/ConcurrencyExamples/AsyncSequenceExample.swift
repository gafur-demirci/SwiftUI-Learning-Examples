//
//  AsyncSequenceExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.09.2024.
//

import SwiftUI

struct ImageIterator: AsyncIteratorProtocol {
    let imageList: [String]
    var currentIndex: Int = 0
    
    mutating func next() async throws -> String? {
        guard currentIndex < imageList.count else { return nil }
        try? await Task.sleep(nanoseconds: 3 * 100000000)
        
        let image = imageList[currentIndex]
        currentIndex += 1
        return image
    }
}

struct ImageLoader: AsyncSequence {
    typealias Element = String
    let imageList: [String]
    
    func makeAsyncIterator() -> ImageIterator {
        return AsyncIterator(imageList: imageList)
    }
    
}

struct AsyncSequenceExample: View {
    
    let list = ["image1", "image2", "image3"]
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
        }
        .onAppear {
            Task(priority: .background) {
                let loader = ImageLoader(imageList: self.list)
                for try await image in loader {
                    print(image)
                }
            }
        }
    }
}

#Preview {
    AsyncSequenceExample()
}
