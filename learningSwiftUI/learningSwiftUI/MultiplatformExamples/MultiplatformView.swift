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
                .padding()
            TextField("Insert Address", text: Bindable(appData).inputAddress)
                .padding([.leading, .trailing])
                .focusedValue(\.address, appData.inputAddress)
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
