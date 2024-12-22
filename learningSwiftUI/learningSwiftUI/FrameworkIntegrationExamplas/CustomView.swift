//
//  CustomView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        VStack {
            MyCustomView()
                .frame(width: 200, height: 200)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    CustomView()
}
