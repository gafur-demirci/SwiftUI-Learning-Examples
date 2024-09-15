//
//  ActorExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.09.2024.
//

import SwiftUI

class ItemData {
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
    
    var item: ItemData = ItemData()
    
    var body: some View {
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
    }
}

#Preview {
    ActorExample()
}
