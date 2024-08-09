//
//  PickerViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 9.08.2024.
//

import SwiftUI

struct PickerViewExample: View {
    
    @State private var selectedValue: String = "No value"
    let listCities: [String] = ["Paris","Toronto", "Dublin"]
    
    var body: some View {
        VStack {
            Text(selectedValue)
            Picker("Cities", selection: $selectedValue) {
                ForEach(listCities, id: \.self) { value in
                    Text(value)
                }
            }
            Spacer()
        }
        .padding()
        .onAppear {
            selectedValue = listCities[2]
        }
    }
}

#Preview {
    PickerViewExample()
}
