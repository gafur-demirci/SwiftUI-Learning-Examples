//
//  FormViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 10.08.2024.
//

import SwiftUI

struct FormViewExample: View {
    
    @State private var setActive: Bool = false
    @State private var setShowPictures: Bool = false
    @State private var setTotal: Int = 10
    
    var body: some View {
        Form {
            DisclosureGroup("Controls") {
                Toggle("Active", isOn: $setActive)
                Toggle("Show Pictures", isOn: $setShowPictures)
            }
            DisclosureGroup("Values") {
                HStack {
                    Text("Total")
                    Spacer()
                    Text(String(setTotal))
                    Stepper("", value: $setTotal, in: 0...10)
                        .labelsHidden()
                }
            }
        }
    }
}

#Preview {
    FormViewExample()
}
