//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Abdulgafur Demirci on 2.05.2025.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
          .antialiased(true)
          .resizable()
          .scaledToFill()
          .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundImageView()
}
