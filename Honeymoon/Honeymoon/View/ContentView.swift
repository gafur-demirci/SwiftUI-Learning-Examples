//
//  ContentView.swift
//  Honeymoon
//
//  Created by Abdulgafur Demirci on 6.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @State private var showAlert: Bool = false
    @State private var showGuide: Bool = false
    @State private var showInfo: Bool = false
    @GestureState private var dragState: DragState = .inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition : AnyTransition = AnyTransition.trailingBottom
    
    // MARK: - CARD VIEWS
    
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 { // only 2 card render
            views.append(CardView(honeymoon: HoneymoonData[index]))
        }
        return views
    }() // return to card view list
    
    // MARK: - MOVE THE CARD
    
    private func moveCards() {
        cardViews.removeFirst()
        
        self.lastCardIndex += 1
        
        let honeymoon = HoneymoonData[self.lastCardIndex % HoneymoonData.count]
        
        let newCardView = CardView(honeymoon: honeymoon)
        
        cardViews.append(newCardView)
    }
    
    // MARK: - TOP CARD
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else { return false }
        return index == 0
    }
    
    // MARK: - DRAG STATES
    
    enum DragState {
      case inactive
      case pressing
      case dragging(translation: CGSize)
      
      var translation: CGSize {
        switch self {
        case .inactive, .pressing:
          return .zero
        case .dragging(let translation):
          return translation
        }
      }
      
      var isDragging: Bool {
        switch self {
        case .dragging:
          return true
        case .pressing, .inactive:
          return false
        }
      }
      
      var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
          return true
        case .inactive:
          return false
        }
      }
    }
    
    var body: some View {
        VStack {
            // MARK: - HEADER
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
            
            Spacer()
            
            // MARK: - CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0) // top of card setting
                        .overlay(content: {
                            ZStack {
                                // MARK: - X-MARK SYMBOL
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                // MARK: - HEART SYMBOL
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        })
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0) // move to offetting gesture area (use only top card)
                        .scaleEffect( self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0) // dragging with zoom out (use only top card)
                        .rotationEffect(.degrees(self.isTopCard(cardView: cardView) ? self.dragState.translation.width / 12 : 0 )) // rotation with translation by 12 with origin (use only top card)
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: self.dragState.isDragging) // dragging with smoothly animation
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { (value, state, transaction) in
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default :
                                        break
                                    }
                                })
                                .onChanged({ (value) in
                                    guard case .second(true, let drag?) = value else { return }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold {
                                        self.cardRemovalTransition = .leadingBottom
                                    }
                                    
                                    if drag.translation.width > self.dragAreaThreshold {
                                        self.cardRemovalTransition = .trailingBottom
                                    }
                                })
                                .onEnded({ (value) in
                                    guard case .second(true, let drag?) = value else { return }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                        playSound(sound: "sound-rise", type: "mp3")
                                        self.moveCards()
                                    }
                                })
                        ) //: GESTURE
                        .transition(self.cardRemovalTransition)
                }
            } //: ZSTACK
            .padding(.horizontal)
//            CardView(honeymoon: HoneymoonData[0])
//                .padding()
            
            Spacer()
            
            // MARK: - FOOTER
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        } //: VSTACK
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Wishing a lovely and most precious of the times together for the amazing couple!"),
                dismissButton: .default(Text("Happy Honeymoon!")))
        }
        .sheet(isPresented: $showInfo, content: {
            InfoView()
        })
    }
}

#Preview {
    ContentView()
}
