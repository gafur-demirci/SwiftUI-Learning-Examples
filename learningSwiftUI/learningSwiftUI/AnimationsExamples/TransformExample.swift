//
//  TransformExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 4.12.2024.
//

import SwiftUI

struct TransformExample: View {
    var body: some View {
        HStack {
            Triangle()
                .trim(from: 0, to: 0.70)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 100, height: 100)
            /*
            Triangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
            Triangle()
                .scale(x: -1, y: 1)
                .fill(Color.blue)
                .frame(width: 100, height: 100)
             */
        }
        /*
        RoundedRectangle(cornerRadius: 20)
            .rotation(.degrees(45))
            .fill(Color.red)
            .frame(width: 100, height: 100)
        
        Image("book5")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 200)
            .clipShape(Circle())
         */
    }
}

#Preview {
    TransformExample()
}
