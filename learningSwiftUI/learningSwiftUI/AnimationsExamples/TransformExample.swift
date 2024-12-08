//
//  TransformExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 4.12.2024.
//

import SwiftUI

struct TransformExample: View {
    var body: some View {
        Image("book5")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 200)
            .scaleEffect(CGSize(width: 0.9, height: 0.9))
            .rotation3DEffect(.degrees(30), axis: (x:0, y:1, z:0))
    }
}

#Preview {
    TransformExample()
}
