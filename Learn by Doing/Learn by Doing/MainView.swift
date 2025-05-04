//
//  MainView.swift
//  Learn by Doing
//
//  Created by Abdulgafur Demirci on 3.05.2025.
//

import SwiftUI

struct MainView: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView() // Your main app view
        }
        else {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.color01, Color.color06]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea(.all)
                
                VStack {
                    Image(systemName: "swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.white)
                    Text("Learn by Doing")
                        .fontWeight(.thin)
                        .foregroundStyle(.white)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
