//
//  ContentView.swift
//  Africa
//
//  Created by Abdulgafur Demirci on 24.04.2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //: MARK - FUNCTIONS
    
    func gridSwitch() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColumn = gridLayout.count
            print("Grid Number: \(gridColumn)")
        }
      
      // TOOLBAR IMAGE
      switch gridColumn {
      case 1:
        toolbarIcon = "square.grid.2x2"
      case 2:
        toolbarIcon = "square.grid.3x2"
      case 3:
        toolbarIcon = "rectangle.grid.1x2"
      default:
        toolbarIcon = "square.grid.2x2"
      }
    }

    var body: some View {

      // MARK: - BODY
      
      NavigationView {
        Group {
          if !isGridViewActive {
            List {
              CoverImageView()
                .frame(height: 300)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalListItemView(animal: animal)
                } //: LINK
              } //: LOOP
              
              CreditsView()
                .modifier(CenterModifier())
            } //: LIST
            .listStyle(.plain)
          } else {
            ScrollView(.vertical, showsIndicators: false) {
              LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(animals) { animal in
                  NavigationLink(destination: AnimalDetailView(animal: animal)) {
                    AnimalGridItemView(animal: animal)
                  } //: LINK
                } //: LOOP
              } //: GRID
              .padding(10)
  //            .animation(.easeIn, value: gridLayout)
  //            .animation(.easeIn)
            } //: SCROLL
          } //: CONDITION
        } //: GROUP
        .navigationBarTitle("Africa", displayMode: .large)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            HStack(spacing: 16) {
              // LIST
              Button(action: {
                print("List view is activated")
                isGridViewActive = false
                haptics.impactOccurred()
              }) {
                Image(systemName: "square.fill.text.grid.1x2")
                  .font(.title2)
                  .foregroundColor(isGridViewActive ? .primary : .accentColor)
              }
              
              // GRID
              Button(action: {
                print("Grid view is activated")
                isGridViewActive = true
                haptics.impactOccurred()
                gridSwitch()
              }) {
                Image(systemName: toolbarIcon)
                  .font(.title2)
                  .foregroundColor(isGridViewActive ? .accentColor : .primary)
              }
            } //: HSTACK
          } //: BUTTONS
        } //: TOOLBAR
      } //: NAVIGATION
    }
}

#Preview {
    ContentView()
}
