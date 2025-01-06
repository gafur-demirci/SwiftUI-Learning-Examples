//
//  CatchTheMouse.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 6.01.2025.
//

import SwiftUI

struct CatchTheMouse: View {
    
    @State private var score: Int = 0
    @State private var highScore: Int = 0
    @State private var countDown: String = "30"
    
    let guides = Array(repeating: GridItem(.flexible(minimum: 120, maximum: 150)), count: 3)
    
    var body: some View {
        VStack {
            Text(String(countDown))
                .padding()
            Text("Score: \(score)")
                .padding()
            LazyVGrid(columns: guides, spacing: 10) {
                ForEach(0...8, id: \.self) { _ in
                    Image("rat")
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            
                        }
                }
            }
            .padding()
            Spacer()
            Text("High Score: \(highScore)")
                .padding()
            Spacer()
        }
        .task {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                if Int(countDown) == 0 {
                    countDown = "Game Over"
                    timer.invalidate()
                }else {
                    let randomNum = Int.random(in: 0...9)
                    print(randomNum)
                    countDown = String(Int(countDown)! - 1)
                }
            })
        }
    }
}

#Preview {
    CatchTheMouse()
}
