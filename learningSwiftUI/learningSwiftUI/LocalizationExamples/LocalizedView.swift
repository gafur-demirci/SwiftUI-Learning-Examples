//
//  LocalizedView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 27.12.2024.
//

import SwiftUI

struct LocalizedView: View {
    
    @State private var counter: Int = 1
    
    var body: some View {
        VStack {
            Text("\(counter) Item")
                .padding()
            Button("Add Unit") {
                counter += 1
            }
            Spacer()
        }
    }
}

#Preview {
    LocalizedView()
}
