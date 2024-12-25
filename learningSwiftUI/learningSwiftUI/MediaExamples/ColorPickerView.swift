//
//  ColorPickerView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 25.12.2024.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State private var selectedColor: Color = .white
    
    var body: some View {
        VStack {
            ColorPicker("Select a Color", selection: $selectedColor)
                .padding()
            Spacer()
        }
        .background(selectedColor)
    }
}

#Preview {
    ColorPickerView()
}
