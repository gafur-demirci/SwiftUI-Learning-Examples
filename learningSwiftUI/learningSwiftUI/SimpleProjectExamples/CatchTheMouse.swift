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
    @State private var countDown: Int = 10
    @State private var isGameOver: Bool = false
    @State private var randomNumber: Int = Int.random(in: 0...8)
    
    let guides = Array(repeating: GridItem(.flexible(minimum: 120, maximum: 150)), count: 3)
    
    var body: some View {
        VStack {
            Text(String(countDown))
                .font(.title.bold())
                .padding()
            Text("Score: \(score)")
                .padding()
            LazyVGrid(columns: guides, spacing: 10) {
                ForEach(0...8, id: \.self) { image in
                    if(image == randomNumber) {
                        Image("rat")
                            .resizable()
                            .scaledToFit()
                            .onTapGesture {
                                if(image == randomNumber) {
                                    score += 1
                                }
                            }
                    } else {
                        Image("rat")
                            .resizable()
                            .scaledToFit()
                            .opacity(0)
                    }
                }
            }
            .padding()
            Spacer()
            Text("High Score: \(highScore)")
                .padding()
            Spacer()
        }
        .task(priority: .high) {
            timerForCountDown()
            timerForRamndomNumber()
        }
        .alert("Time's Up", isPresented: $isGameOver, actions: {
            Button("Cancel", role: .cancel, action: {})
            Button("RePlay", role: .destructive, action: {
                countDown = 10
                score = 0
                timerForCountDown()
                timerForRamndomNumber()
            })
        }, message: {
            Text("Game Over")
        })
    }
    
    func timerForRamndomNumber() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (timer2) in
            if countDown == 0 {
                timer2.invalidate()
            }
            randomNumber = generateRandomNumber()
        })
    }
    
    func timerForCountDown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            
            if countDown > 0 {
                timeDiscriminator()
            } else if countDown == 0 {
                timeDiscriminator()
                timer.invalidate()
            }
        })
    }
    
    func generateRandomNumber() -> Int {
        randomNumber = Int.random(in: 0...8)
        return randomNumber
    }
    
    func timeDiscriminator() {
        if countDown == 0 {
            isGameOver = true
            highScore = max(highScore, score)
        } else {
            countDown -= 1
            randomNumber = generateRandomNumber()
        }
    }
}

#Preview {
    CatchTheMouse()
}
