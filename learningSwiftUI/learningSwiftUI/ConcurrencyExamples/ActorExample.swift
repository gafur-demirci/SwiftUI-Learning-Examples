//
//  ActorExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.09.2024.
//

import SwiftUI

actor ItemData {
    var counter: Int = 0
    let maximum: Int = 50
    
    func incrementCount() -> String {
       counter += 1
        return "Value: \(counter)"
    }
    
    nonisolated func maximumValue() -> String {
        return "Maximum Value: \(maximum)"
    }
}

struct ActorExample: View {
    
//    var item: ItemData = ItemData()
    @State private var myText: String = "Hello World!"
    
    var body: some View {
        VStack {
            Text(myText)
                .padding()
        }
        .onAppear{
            Task(priority: .background, operation: {
                await loadImage(name: "book1")
            })
        }
        /*
        Button("Start Process") {
            let value = item.maximumValue()
            print(value)
            /*
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
                Task(priority: .background) {
                    
                    async let operation = item.incrementCount()
                    print(await operation)
                }
            })
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { (timer) in
                Task(priority: .high) {
                    async let operation = item.incrementCount()
                    print(await operation)
                }
            })
            */
        }
         */
    }
    
    func loadImage(name: String) async {
        await MainActor.run(body: {
            myText = name
        })
        print(name)
    }
}

#Preview {
    ActorExample()
}
