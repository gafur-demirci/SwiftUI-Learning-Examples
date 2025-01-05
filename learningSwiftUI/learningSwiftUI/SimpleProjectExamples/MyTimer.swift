//
//  MyTimer.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 5.01.2025.
//

import SwiftUI

struct MyTimer: View {
    
    @State var counter: Float = 100
    
    var body: some View {
        ProgressView(value: counter, total: 100)
            .progressViewStyle(.linear)
            .padding()
        Text("Time: \(counter.formatted())")
            .padding()
        Button(counter >= 0 ? "Start Process" : "Re-Start Process") {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                if counter >= 0 {
                    counter = counter - 1
                }
            })
        }

    }
}

#Preview {
    MyTimer()
}
