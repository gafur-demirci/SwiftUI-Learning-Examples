//
//  ContentView.swift
//  Slot Machine
//
//  Created by Abdulgafur Demirci on 4.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    let haptics = UINotificationFeedbackGenerator()
    
    @State private var betAmount: Int = 10
    @State private var highScore: Int = UserDefaults.standard.integer(forKey: "HighScore")
    @State private var balance: Int = 100
    @State private var reels: Array = [0, 1, 2]
    @State private var showingInfo: Bool = false
    @State private var isAnimating: Bool = false
    @State private var isBetToTen: Bool = true
    @State private var isBetToTwenty: Bool = false
    @State private var showingModal: Bool = false
    @State private var animatingSymbol: Bool = false
    @State private var animatingModal: Bool = false
    
    // MARK: - FUNCTIONS
    
    // SPIN REELS
    func spinReels() {
//        reels[0] = Int.random(in: 0...symbols.count - 1)
//        reels[1] = Int.random(in: 0...symbols.count - 1)
//        reels[2] = Int.random(in: 0...symbols.count - 1)
        reels = reels.map({ _ in
                Int.random(in: 0...symbols.count - 1)
        })
        playSound(sound: "spin", type: "mp3")
        haptics.notificationOccurred(.success)
    }
    
    // CHECK THE WINNING
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
            playerWins()
            if self.balance > self.highScore {
                newHighScore()
            } else {
                playSound(sound: "win", type: "mp3")
            }
        } else {
            playerLoses()
        }

    }
    
    // PLAYER WINS
    func playerWins() {
        self.balance += self.betAmount * 10
    }
    
    // NEW HIGH SCORE
    func newHighScore() {
        self.highScore = self.balance
        UserDefaults.standard.set(self.highScore, forKey: "HighScore")
        playSound(sound: "high-score", type: "mp3")
    }

    // PLAYER LOSES
    func playerLoses() {
        self.balance -= self.betAmount
    }
    
    // SET BET TO 10
    func setBetToTen() {
        self.betAmount = 10
        self.isBetToTen = true
        self.isBetToTwenty = false
        playSound(sound: "casino-chips", type: "mp3")
        haptics.notificationOccurred(.success)
    }
    
    // SET BET TO 20
    func setBetToTwenty() {
        self.betAmount = 20
        self.isBetToTwenty = true
        self.isBetToTen = false
        playSound(sound: "casino-chips", type: "mp3")
        haptics.notificationOccurred(.success)
    }
    
    // GAME IS OVER
    func gameOver() {
        if self.balance <= 0 {
            // SHOW MODAL WINDOW
            self.showingModal = true
            playSound(sound: "game-over", type: "mp3")
        }
    }
    
    // RESET GAME
    func resetGame() {
        UserDefaults.standard.set(0, forKey: "HighScore")
        self.highScore = 0
        self.balance = 100
        self.setBetToTen()
        playSound(sound: "chimeup", type: "mp3")
    }
    
    // MARK: - BODY
    
    var body: some View {
        
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(
                gradient: Gradient(colors: [.colorPink, .colorPurple]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(edges: .all)
            // MARK: - INTERFACE
            
            VStack(alignment: .center, spacing: 5) {
                // MARK: - HEADER
                LogoView()
                
                Spacer()
                // MARK: - SCORE
                
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        Text("\(balance)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highScore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                
                // MARK: - SLOT MACHINE
                
                VStack(alignment: .center, spacing: 0) {
                    
                    // MARK: - REEL #1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                            .opacity(animatingSymbol ? 1 : 0)
                            .offset(y: animatingSymbol ? 0 : -50)
                            .animation(.easeOut(duration: Double.random(in: 0.5...0.7)), value: animatingSymbol)
                            .onAppear {
                                self.animatingSymbol.toggle()
                                playSound(sound: "riseup", type: "mp3")
                            }
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.7...0.9)), value: animatingSymbol)
                                .onAppear {
                                    self.animatingSymbol.toggle()
                                }
                        }
                        
                        Spacer()
                        
                        // MARK: - REEL #3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.9...1.1)), value: animatingSymbol)
                                .onAppear {
                                    self.animatingSymbol.toggle()
                                }
                        }
                    }

                    // MARK: - SPIN BUTTON
                    Button(action: {
                        // 1. SET THE DEFAULT STATE: NO ANIMATION
                        withAnimation{
                            self.animatingSymbol = false
                        }
                        
                        // 2. SPIN THE REELS WIH CHANGING THE SYMBOLS
                        self.spinReels()
                        
                        // 3. TRIGGER THE ANIMATION AFTER CHANGING THE SYMBOLS
                        withAnimation {
                            self.animatingSymbol = true
                        }
                        
                        // 4. CHECK WINNING
                        self.checkWinning()
                        
                        // 5. GAME IS OVER
                        self.gameOver()
                        
                    }, label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    })
                } //: SLOT MACHINE
                .layoutPriority(2)
                
                
                // MARK: - FOOTER
                
                Spacer()
                
                HStack {
                    // MARK: - BET 20
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            self.setBetToTwenty()
                        }, label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundStyle(isBetToTwenty ? .yellow : .white)
                                .modifier(BetNumberModifier())
                        })
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .offset(x: isBetToTwenty ? 0 : 20)
                            .opacity(isBetToTwenty ? 1 : 0)
                            .animation(.default, value: isAnimating)
                            .modifier(CasinoChipsModifier())
                    }
                    
                    Spacer()
                    
                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .offset(x: isBetToTen ? 0 : -20)
                            .opacity(isBetToTen ? 1 : 0)
                            .animation(.default, value: isAnimating)
                            .modifier(CasinoChipsModifier())
                        
                        Button(action: {
                            self.setBetToTen()
                        }, label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundStyle(isBetToTen ? .yellow : .white)
                                .modifier(BetNumberModifier())
                        })
                        .modifier(BetCapsuleModifier())
                    }
                }
            }
            // MARK: - BUTTONS
            .overlay(
                // RESET
                Button(action: {
                    self.resetGame()
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                        .modifier(ButtonModifier())
                }),
                alignment: .topLeading
            )
            .overlay(
                // INFO
                Button(action: {
                    self.showingInfo = true
                }, label: {
                    Image(systemName: "info.circle")
                        .modifier(ButtonModifier())
                }),
                alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
            .blur(radius: $showingModal.wrappedValue ? 5 : 0, opaque: false)
            // MARK: - POPUP
            if self.$showingModal.wrappedValue {
                ZStack {
                    Color.colorTransparentBlack
                        .edgesIgnoringSafeArea(.all)
                    
                    // MODAL
                    VStack(spacing: 0) {
                        // TITLE
                        Text("GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(.colorPink)
                            .foregroundColor(.white)
                        Spacer()
                        // MESSAGE
                        VStack(alignment: .center, spacing: 16) {
                            Image("gfx-seven-reel")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 72)
                            
                            Text("Bad luck! You lost all of the coins. \nLet's play again!")
                                .font(.system(.body, design: .rounded))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.gray)
                                .layoutPriority(1)
                            Button(action: {
                                self.showingModal = false
                                self.animatingModal = false
                                self.setBetToTen()
                                self.balance = 100
                            }, label: {
                                Text("New Game!".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .tint(.colorPink)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.75)
                                            .foregroundStyle(.colorPink)
                                    )
                            })
                        }
                        
                        Spacer()
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .colorTransparentBlack, radius: 6, x: 0, y: 8)
                    .opacity($animatingModal.wrappedValue ? 1 : 0)
                    .offset(y: $animatingModal.wrappedValue ? 0 : -100)
                    .animation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0), value: animatingModal)
                    .onAppear {
                        self.animatingModal = true
                    }
                }
            }
            
            
        } //: ZSTACK
        .onAppear {
            self.isAnimating = true
        }
        .sheet(isPresented: $showingInfo) {
            InfoView()
        }
    }
}

#Preview {
    ContentView()
}
