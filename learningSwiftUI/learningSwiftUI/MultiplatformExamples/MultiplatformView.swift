//
//  MultiplatformView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 25.12.2024.
//

import SwiftUI

struct MultiplatformView: View {
    
    @Environment(MacData.self) private var appData
    
    var body: some View {
        VStack {
            TextField("Insert your name", text: Bindable(appData).inputMessage)
            Spacer()
        }
        .padding()
        .frame(width: 500, height: 350)
    }
}

#Preview {
    MultiplatformView()
        .environment(MacData())
}
