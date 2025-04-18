//
//  PickerViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 9.08.2024.
//

import SwiftUI

struct PickerViewExample: View {
    
    @State private var selectedValue: Int = 0
    let listCities: [String] = ["Paris","Toronto", "Dublin"]
    
    var body: some View {
        VStack {
            Text(listCities[selectedValue])
            Picker("Cities", selection: $selectedValue) {
                ForEach(listCities.indices, id: \.self) { value in
                    Text(listCities[value])
                        .tag(value)
                }
            }
            .pickerStyle(.segmented)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PickerViewExample()
}
