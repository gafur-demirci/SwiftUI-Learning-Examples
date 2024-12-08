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
            .clipShape(Circle())
    }
}

#Preview {
    TransformExample()
}
