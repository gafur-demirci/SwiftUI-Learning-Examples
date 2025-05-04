//
//  AppView.swift
//  Avocados
//
//  Created by Abdulgafur Demirci on 3.05.2025.
//

import SwiftUI

struct AppView: View {
    var body: some View {
      TabView {
        AvocadosView()
          .tabItem({
            Image("tabicon-branch")
            Text("Avocados")
          })
        ContentView()
          .tabItem({
            Image("tabicon-book")
            Text("Recipes")
          })
        RipeningStagesView()
          .tabItem({
            Image("tabicon-avocado")
            Text("Ripening")
          })
        SettingsView()
          .tabItem({
            Image("tabicon-settings")
            Text("Settings")
          })
      }
      .accentColor(Color.primary)
    }
    
//    @State private var isActive = false
//    
//    var body: some View {
//        if isActive {
//            ContentView() // Your main app view
//        }
//        else {
//            ZStack {
//                LinearGradient(
//                    gradient: Gradient(colors: [.red, .blue]),
//                    startPoint: .top,
//                    endPoint: .bottom
//                )
//                .ignoresSafeArea(.all)
//                
//                VStack {
//                    Image(systemName: "swift")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 80, height: 80)
//                        .foregroundStyle(.white)
//                    Text("Learn by Doing")
//                        .fontWeight(.thin)
//                        .foregroundStyle(.white)
//                }
//                .onAppear {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                        withAnimation {
//                            self.isActive = true
//                        }
//                    }
//                }
//            }
//        }
//    }
}

#Preview {
    AppView()
}
