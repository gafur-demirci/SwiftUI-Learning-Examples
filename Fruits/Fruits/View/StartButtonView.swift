//
//  StartButtonView.swift
//  Fruits
//
//  Created by Abdulgafur Demirci on 21.04.2025.
//

import SwiftUI

struct StartButtonView: View {
    
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    StartButtonView()
}
