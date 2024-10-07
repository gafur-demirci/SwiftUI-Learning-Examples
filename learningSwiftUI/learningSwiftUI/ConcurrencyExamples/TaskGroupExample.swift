//
//  TaskGroupExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 7.10.2024.
//

import SwiftUI

struct TaskGroupExample: View {
    var body: some View {
        VStack {
            Text("Hello World!")
                .padding()
        }
        .onAppear {
            Task(priority: .background) {
                await withTaskGroup(of: String.self, body: {group in
                    group.addTask(priority: .background) {
                        let imageName = await self.loadImage(name: "image1")
                        return imageName
                    }
                    group.addTask(priority: .background) {
                        let imageName = await self.loadImage(name: "image2")
                        return imageName
                    }
                    group.addTask(priority: .background) {
                        let imageName = await self.loadImage(name: "image3")
                        return imageName
                    }
                    for await result in group {
                        print(result)
                    }
                })
            }
        }
    }
    
    func loadImage(name: String) async -> String {
        try? await Task.sleep(for: .nanoseconds(3 * 1000000000))
        return "Name: \(name)"
    }
}

#Preview {
    TaskGroupExample()
}
